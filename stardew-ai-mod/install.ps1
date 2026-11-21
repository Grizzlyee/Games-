#Requires -Version 5.1
<#
  Stardew AI Expanded (SAE) V2 자동 설치 스크립트 (Windows 전용)

  하는 일
    1. 스타듀밸리 설치 폴더 찾기 (Steam / GOG)
    2. SMAPI 최신판 내려받아 무인 설치 (이미 있으면 건너뜀)
    3. SAE V2 모드를 글의 구글 드라이브 링크에서 내려받아 Mods 폴더에 설치
    4. 다운로드 폴더에 GMCM 압축 파일이 있으면 함께 설치 (선택 사항)
    5. config.json 에 오픈라우터 키와 모델 입력
    6. 바탕화면에 SMAPI 실행 바로가기 만들기

  사용법: install.bat 더블클릭.  옵션 예) install.bat -GamePath "D:\Games\Stardew Valley"
#>
param(
    [string]$GamePath = "",
    [string]$Model = "",
    [switch]$SkipKey
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# ---- 고정 값 (2026-11-21 확인) ----
$SaeDriveId = "1Ism9-NLgD7NKiyxJ7V1tpMHwarfmea1e"   # 디시 글 283943 / 285961 의 다운로드 링크
$SaeSha256  = "AB013B7808EAA6346F1739283BA7AB52C86664DE926E35DD970DD57A6A688B28"  # 검사한 파일의 해시
$SaeFolder  = "Stardew AI Expanded"
$GameDll    = "Stardew Valley.dll"
$Work       = Join-Path $env:TEMP "sae-install"

function Say($msg)  { Write-Host "`n== $msg" -ForegroundColor Cyan }
function Note($msg) { Write-Host "   $msg" }
function Warn($msg) { Write-Host "   [주의] $msg" -ForegroundColor Yellow }
function Die($msg)  { Write-Host "`n[중단] $msg" -ForegroundColor Red; exit 1 }

function Test-GameDir($dir) {
    return ($dir -and (Test-Path -LiteralPath (Join-Path $dir $GameDll)))
}

function Get-RegValue($key, $name) {
    try { return (Get-ItemProperty -Path $key -Name $name -ErrorAction Stop).$name } catch { return $null }
}

function Find-GameDir {
    $candidates = New-Object System.Collections.Generic.List[string]
    $v = Get-RegValue "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 413150" "InstallLocation"
    if ($v) { $candidates.Add($v) }
    $v = Get-RegValue "HKLM:\SOFTWARE\WOW6432Node\GOG.com\Games\1453375253" "PATH"
    if ($v) { $candidates.Add($v) }

    $steam = Get-RegValue "HKCU:\Software\Valve\Steam" "SteamPath"
    if ($steam) {
        $steam = $steam -replace "/", "\"
        $candidates.Add((Join-Path $steam "steamapps\common\Stardew Valley"))
        $vdf = Join-Path $steam "steamapps\libraryfolders.vdf"
        if (Test-Path -LiteralPath $vdf) {
            foreach ($m in [regex]::Matches((Get-Content -LiteralPath $vdf -Raw), '"path"\s+"([^"]+)"')) {
                $lib = $m.Groups[1].Value -replace '\\\\', '\'
                $candidates.Add((Join-Path $lib "steamapps\common\Stardew Valley"))
            }
        }
    }
    $candidates.Add("C:\Program Files (x86)\Steam\steamapps\common\Stardew Valley")
    $candidates.Add("C:\Program Files (x86)\GOG Galaxy\Games\Stardew Valley")
    $candidates.Add("C:\GOG Games\Stardew Valley")

    foreach ($c in $candidates) { if (Test-GameDir $c) { return $c.TrimEnd("\") } }
    return $null
}

function Get-File($url, $out) {
    $curl = Join-Path $env:SystemRoot "System32\curl.exe"
    if (Test-Path -LiteralPath $curl) {
        & $curl -L --fail --retry 3 -o $out $url
        if ($LASTEXITCODE -ne 0) { throw "내려받기 실패 (curl 종료 코드 $LASTEXITCODE): $url" }
    } else {
        Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing
    }
}

function Expand-Zip($zip, $dest) {
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    $tar = Join-Path $env:SystemRoot "System32\tar.exe"
    if (Test-Path -LiteralPath $tar) {
        & $tar -xf $zip -C $dest
        if ($LASTEXITCODE -ne 0) { throw "압축 풀기 실패: $zip" }
    } else {
        Expand-Archive -LiteralPath $zip -DestinationPath $dest -Force
    }
}

# ---------------------------------------------------------------- 1. 게임 폴더
Say "1/6 스타듀밸리 설치 폴더 찾기"
if ($GamePath) { $game = $GamePath.Trim('"').TrimEnd("\") } else { $game = Find-GameDir }
while (-not (Test-GameDir $game)) {
    Warn "스타듀밸리 폴더를 찾지 못했습니다. ('$GameDll' 파일이 있는 폴더여야 합니다)"
    Note "Steam: 라이브러리 > 스타듀밸리 우클릭 > 관리 > 로컬 파일 보기 로 폴더를 열어 주소를 복사하세요."
    $game = (Read-Host "   폴더 경로 입력 (그만두려면 그냥 Enter)").Trim('"').TrimEnd("\")
    if (-not $game) { Die "게임 폴더가 없어 중단했습니다. 스타듀밸리를 먼저 설치하세요." }
}
Note "게임 폴더: $game"
$mods = Join-Path $game "Mods"

while (Get-Process -Name "Stardew Valley", "StardewModdingAPI" -ErrorAction SilentlyContinue) {
    Warn "게임이 실행 중입니다. 게임을 끈 뒤 Enter 를 누르세요."
    Read-Host | Out-Null
}

New-Item -ItemType Directory -Force -Path $Work | Out-Null

# ---------------------------------------------------------------- 2. SMAPI
Say "2/6 SMAPI 설치"
$smapiExe = Join-Path $game "StardewModdingAPI.exe"
if (Test-Path -LiteralPath $smapiExe) {
    Note "이미 설치되어 있어 건너뜁니다."
} else {
    $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/Pathoschild/SMAPI/releases/latest" -Headers @{ "User-Agent" = "sae-installer" }
    $asset = $rel.assets | Where-Object { $_.name -like "SMAPI-*-installer.zip" } | Select-Object -First 1
    if (-not $asset) { Die "SMAPI 설치 파일을 찾지 못했습니다. https://smapi.io 에서 직접 설치한 뒤 다시 실행하세요." }
    Note "내려받는 중: $($asset.name)"
    $smapiZip = Join-Path $Work $asset.name
    Get-File $asset.browser_download_url $smapiZip
    $smapiDir = Join-Path $Work "smapi"
    if (Test-Path -LiteralPath $smapiDir) { Remove-Item -LiteralPath $smapiDir -Recurse -Force }
    Expand-Zip $smapiZip $smapiDir
    $installer = Get-ChildItem -LiteralPath $smapiDir -Recurse -Filter "SMAPI.Installer.exe" |
        Where-Object { $_.FullName -like "*\internal\windows\*" } | Select-Object -First 1
    if (-not $installer) { Die "SMAPI 설치 프로그램을 압축 파일에서 찾지 못했습니다." }
    & $installer.FullName --install --game-path $game --no-prompt
    if (-not (Test-Path -LiteralPath $smapiExe)) {
        Die "SMAPI 자동 설치가 끝나지 않았습니다. '$($installer.Directory.Parent.Parent.FullName)' 안의 'install on Windows.bat' 을 직접 실행한 뒤 이 스크립트를 다시 실행하세요."
    }
    Note "SMAPI $($rel.tag_name) 설치 완료"
}
New-Item -ItemType Directory -Force -Path $mods | Out-Null

# ---------------------------------------------------------------- 3. SAE V2
Say "3/6 Stardew AI Expanded V2 내려받기 (약 540MB, 몇 분 걸립니다)"
$saeZip = Join-Path $Work "sae_v2.zip"
$haveGood = (Test-Path -LiteralPath $saeZip) -and ((Get-FileHash -LiteralPath $saeZip -Algorithm SHA256).Hash -eq $SaeSha256)
if ($haveGood) {
    Note "이전에 받은 파일을 다시 씁니다."
} else {
    Get-File "https://drive.usercontent.google.com/download?id=$SaeDriveId&export=download&confirm=t" $saeZip
    if ((Get-Item -LiteralPath $saeZip).Length -lt 100MB) {
        Die "받은 파일이 너무 작습니다. 구글 드라이브 링크가 바뀌었거나 다운로드 한도에 걸렸을 수 있습니다. 디시 글의 링크에서 직접 받아 '$saeZip' 로 저장한 뒤 다시 실행하세요."
    }
    $hash = (Get-FileHash -LiteralPath $saeZip -Algorithm SHA256).Hash
    if ($hash -ne $SaeSha256) {
        Warn "파일이 2026-11-21 에 검사한 것과 다릅니다 (작성자가 모드를 업데이트했을 수 있습니다)."
        Note "받은 해시: $hash"
        if ((Read-Host "   그래도 설치할까요? (y/N)") -notmatch '^[yY]') { Die "설치를 중단했습니다." }
    }
}

Say "4/6 모드 설치"
$dest = Join-Path $mods $SaeFolder
$backup = $null
if (Test-Path -LiteralPath $dest) {
    # 백업은 Mods 밖(같은 드라이브)에 둔다. Mods 안에 두면 SMAPI 가 중복 모드로 읽음
    $backup = Join-Path $game ("SAE-backup-" + (Get-Date -Format "yyyyMMdd-HHmmss"))
    Move-Item -LiteralPath $dest -Destination $backup
    Note "기존 모드 폴더를 백업했습니다: $backup"
}
# 압축 파일의 최상위 폴더가 'Stardew AI Expanded' 이므로 Mods 에 바로 푼다
Expand-Zip $saeZip $mods
if (-not (Test-Path -LiteralPath (Join-Path $dest "manifest.json"))) { Die "압축을 풀었지만 '$dest\manifest.json' 이 없습니다." }
if ($backup) {
    # 글 안내: 기존 data 폴더를 새 버전에 복사하면 기억이 보존됨
    $oldData = Join-Path $backup "data"
    if (Test-Path -LiteralPath $oldData) { Copy-Item -Path (Join-Path $oldData "*") -Destination (Join-Path $dest "data") -Recurse -Force }
    $oldCfg = Join-Path $backup "config.json"
    if (Test-Path -LiteralPath $oldCfg) { Copy-Item -LiteralPath $oldCfg -Destination $dest -Force }
    Note "기존 data 폴더와 config.json 을 새 버전으로 옮겼습니다."
}
Note "설치 위치: $dest"

# GMCM (선택 사항): 넥서스는 로그인이 필요해 자동으로 받을 수 없음
$gmcmInstalled = Get-ChildItem -LiteralPath $mods -Recurse -Filter "manifest.json" -Depth 3 -ErrorAction SilentlyContinue |
    Where-Object { (Get-Content -LiteralPath $_.FullName -Raw) -match "spacechase0\.GenericModConfigMenu" -and $_.FullName -notlike "*\$SaeFolder\*" } |
    Select-Object -First 1
if ($gmcmInstalled) {
    Note "GMCM 이 이미 설치되어 있습니다."
} else {
    $gmcmZip = Get-ChildItem -Path (Join-Path $env:USERPROFILE "Downloads") -Filter "*.zip" -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match "Generic\s*Mod\s*Config\s*Menu" } | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($gmcmZip) {
        Expand-Zip $gmcmZip.FullName $mods
        Note "GMCM 설치: $($gmcmZip.Name)"
    } else {
        Note "GMCM 은 설치하지 않았습니다 (없어도 모드는 동작합니다)."
        Note "게임 안에서 설정을 바꾸려면 https://www.nexusmods.com/stardewvalley/mods/5098 에서 받아"
        Note "다운로드 폴더에 둔 뒤 이 스크립트를 다시 실행하세요."
    }
}

# ---------------------------------------------------------------- 5. 설정
Say "5/6 오픈라우터 키와 모델 설정"
$cfgPath = Join-Path $dest "config.json"
if (Test-Path -LiteralPath $cfgPath) {
    $cfg = Get-Content -LiteralPath $cfgPath -Raw -Encoding UTF8 | ConvertFrom-Json
} else {
    # 빠진 항목은 SMAPI 가 첫 실행 때 기본값으로 채운다
    $cfg = New-Object PSObject
}
function Set-Cfg($name, $value) {
    if ($cfg.PSObject.Properties[$name]) { $cfg.$name = $value }
    else { $cfg | Add-Member -NotePropertyName $name -NotePropertyValue $value }
}

if (-not $Model) {
    Note "모델 선택:"
    Note "  1) anthropic/claude-sonnet-5.5   품질 우선 (기본)"
    Note "  2) anthropic/claude-haiku-5.5    빠르고 저렴"
    Note "  3) google/gemini-3.8-flash       글 작성자가 쓰던 Gemini Flash 계열"
    Note "  4) 직접 입력"
    switch ((Read-Host "   번호 (Enter = 1)").Trim()) {
        "2" { $Model = "anthropic/claude-haiku-5.5" }
        "3" { $Model = "google/gemini-3.8-flash" }
        "4" { $Model = (Read-Host "   오픈라우터 모델 ID").Trim() }
        default { $Model = "anthropic/claude-sonnet-5.5" }
    }
}
if (-not $Model) { $Model = "anthropic/claude-sonnet-5.5" }
Set-Cfg "Model" $Model
Set-Cfg "SummaryModel" $Model
Note "모델: $Model"

if (-not $SkipKey) {
    Note "오픈라우터 키(sk-or-...)를 붙여넣으세요. 화면에 표시되지 않습니다. 나중에 넣으려면 그냥 Enter."
    $sec = Read-Host "   키" -AsSecureString
    $key = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec)).Trim()
    if ($key) {
        if ($key -notlike "sk-or-*") { Warn "키가 'sk-or-' 로 시작하지 않습니다. Anthropic 키(sk-ant-)는 여기가 아니라 오픈라우터 BYOK 설정에 넣어야 합니다." }
        Set-Cfg "OpenRouterApiKey" $key
        Note "키를 저장했습니다."
    } else {
        Warn "키를 넣지 않았습니다. 나중에 '$cfgPath' 의 OpenRouterApiKey 에 넣거나 이 스크립트를 다시 실행하세요."
    }
}
[IO.File]::WriteAllText($cfgPath, ($cfg | ConvertTo-Json -Depth 20), (New-Object Text.UTF8Encoding($false)))

# ---------------------------------------------------------------- 6. 바로가기
Say "6/6 바탕화면 바로가기"
try {
    $lnk = Join-Path ([Environment]::GetFolderPath("Desktop")) "Stardew Valley (SMAPI).lnk"
    $sc = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk)
    $sc.TargetPath = $smapiExe
    $sc.WorkingDirectory = $game
    $sc.Save()
    Note "만들었습니다: $lnk"
} catch { Warn "바로가기를 만들지 못했습니다. '$smapiExe' 를 직접 실행하세요." }

Say "끝났습니다"
Note "바탕화면의 'Stardew Valley (SMAPI)' 로 게임을 실행하세요 (모드는 SMAPI 로 실행해야 적용됩니다)."
Note "NPC 에게 말을 걸어 AI 대화가 나오는지 확인하고, 오류가 나면 SMAPI 창(검은 창)의 빨간 글씨를 복사해 주세요."
Note "임시 파일($Work, 약 550MB)은 문제없이 설치된 뒤 지워도 됩니다."
