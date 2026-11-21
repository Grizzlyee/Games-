﻿#Requires -Version 5.1
<#
  스타듀밸리 모드 자동 설치 스크립트 (Windows 전용)

  하는 일
    1. 스타듀밸리 설치 폴더 찾기 (Steam / GOG)
    2. SMAPI 최신판 내려받아 무인 설치 (이미 있으면 건너뜀)
    3. 넥서스 모드 17개 설치 (선행 모드 포함, 목록은 아래 $NexusMods)
       - 넥서스 프리미엄 + API 키: 전부 자동으로 내려받음
       - 무료 계정: 다운로드 페이지를 열어 주고, 받은 파일을 다운로드 폴더에서 찾아 설치
    4. Stardew AI Expanded V2 를 디시 글의 구글 드라이브 링크에서 내려받아 설치
    5. config.json 에 오픈라우터 키와 모델 입력
    6. 바탕화면에 SMAPI 실행 바로가기 만들기
    7. 설치된 모든 모드의 선행 모드가 갖춰졌는지 점검

  사용법: install.bat 더블클릭.
  옵션 예) install.bat -GamePath "D:\Games\Stardew Valley"   install.bat -SkipNexus   install.bat -CheckLog
#>
param(
    [string]$GamePath = "",
    [string]$Model = "",
    [string]$NexusKey = "",
    [switch]$SkipKey,
    [switch]$SkipNexus,
    [switch]$SkipSae,
    [switch]$CheckLog
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Add-Type -AssemblyName System.IO.Compression.FileSystem

# ---- 고정 값 (2026-11-21 확인) ----
$SaeDriveId = "1Ism9-NLgD7NKiyxJ7V1tpMHwarfmea1e"   # 디시 글 283943 / 285961 의 다운로드 링크
$SaeSha256  = "AB013B7808EAA6346F1739283BA7AB52C86664DE926E35DD970DD57A6A688B28"  # 검사한 파일의 해시
$SaeFolder  = "Stardew AI Expanded"
$GameDll    = "Stardew Valley.dll"
$Work       = Join-Path $env:TEMP "sae-install"
$Downloads  = Join-Path $env:USERPROFILE "Downloads"

# 넥서스 모드 목록. 위에서 아래 순서로 설치한다 (뒤의 것이 앞의 것을 덮어씀).
# Marker = 설치되면 Mods 폴더 안에 생기는 파일 (이미 있으면 건너뜀). 번호·파일·폴더 구조는 넥서스 API 로 확인함.
$NexusMods = @(
    @{ Name = "Content Patcher 2.9.1";                 Id = 1915;  File = 160463; Marker = "ContentPatcher\manifest.json" }
    @{ Name = "Generic Mod Config Menu 1.16.0";        Id = 5098;  File = 145906; Marker = "GenericModConfigMenu\manifest.json" }
    @{ Name = "Farm Type Manager 1.26.1";              Id = 3231;  File = 148044; Marker = "FarmTypeManager\manifest.json" }
    @{ Name = "Sprites in Detail 0.6.1";               Id = 14487; File = 128149; Marker = "SpritesInDetail\manifest.json" }
    @{ Name = "Stardew Valley Expanded 1.15.11";       Id = 3753;  File = 135998; Marker = "Stardew Valley Expanded\[CP] Stardew Valley Expanded\manifest.json" }
    @{ Name = "Anthro Characters Continued 11.3.0";    Id = 1083;  File = 174480; Marker = "AnthroCharactersContinued\manifest.json" }
    @{ Name = "Alternate Anthro Andy 1.0.1";           Id = 24727; File = 102013; Marker = "AltAnthroAndy\manifest.json" }
    @{ Name = "Hakan NPC 0.9.6";                       Id = 26541; File = 147033; Marker = "[CP] Haki_Stardew\manifest.json" }
    @{ Name = "Hakan NPC 한국어 패치 1.0";             Id = 28225; File = 112199; Marker = "[CP] Haki_Stardew\i18n\ko.json" }   # Hakan 뒤에 설치해야 함
    @{ Name = "Bara Anthro Characters";                Id = 22977; File = 115028; Marker = "BaraAnthroCharacters-1.2\manifest.json" }
    @{ Name = "Enti's Furry Barafications 1.2 (선행)"; Id = 24846; File = 108174; Marker = "Enti's Furry Barafications\Enti's Furry Barafications\manifest.json" }
    @{ Name = "Bara Anthro XL 1.13";                   Id = 44387; File = 165753; Marker = "Bara Anthro Characters XL\manifest.json" }
    @{ Name = "Bara Anthro Character Supplement 1.1.3"; Id = 30064; File = 131336; Marker = "Bara Anthro Character Supplement\manifest.json" }
    @{ Name = "Bara Anthro Shane 1.1.3";               Id = 26738; File = 121913; Marker = "[CP]Bara Anthro Shane\manifest.json" }
    @{ Name = "Bara Anthro Alex 1.1.0";                Id = 29085; File = 114879; Marker = "[CP]Bara Anthro Alex\manifest.json" }
    @{ Name = "Bara Anthro Giant Crop 1.1.0";          Id = 30778; File = 121899; Marker = "[CP]Bara Anthro Giant Crop\manifest.json" }
    @{ Name = "StardewAIExpanded Extended Input 1";    Id = 52692; File = 183722; Marker = "StardewAIExpandedExtendedInput\manifest.json" }
)

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
        if ($LASTEXITCODE -ne 0) { throw "내려받기 실패 (curl 종료 코드 $LASTEXITCODE)" }
    } else {
        Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing
    }
}

# zip 은 .NET 으로 직접 푼다 (대괄호가 든 폴더 이름과 덮어쓰기를 안전하게 처리)
function Expand-ZipNet($zip, $dest) {
    $root = [IO.Path]::GetFullPath($dest).TrimEnd("\") + "\"
    $archive = [IO.Compression.ZipFile]::OpenRead($zip)
    try {
        foreach ($entry in $archive.Entries) {
            $target = [IO.Path]::GetFullPath((Join-Path $root $entry.FullName))
            if (-not $target.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) { continue }   # 폴더 밖으로 나가는 경로는 무시
            if ($entry.FullName.EndsWith("/") -or $entry.FullName.EndsWith("\")) {
                [IO.Directory]::CreateDirectory($target) | Out-Null
            } else {
                [IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($target)) | Out-Null
                [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $target, $true)
            }
        }
    } finally { $archive.Dispose() }
}

# rar/7z 과 큰 zip 은 윈도우 내장 tar(bsdtar) 로, 안 되면 7-Zip 으로 푼다
function Expand-WithTar($file, $dest) {
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    $tar = Join-Path $env:SystemRoot "System32\tar.exe"
    if (Test-Path -LiteralPath $tar) {
        & $tar -xf $file -C $dest | Out-Host
        if ($LASTEXITCODE -eq 0) { return $true }
    }
    foreach ($seven in @("$env:ProgramFiles\7-Zip\7z.exe", "${env:ProgramFiles(x86)}\7-Zip\7z.exe")) {
        if ($seven -and (Test-Path -LiteralPath $seven)) {
            & $seven x $file "-o$dest" -y | Out-Null
            if ($LASTEXITCODE -eq 0) { return $true }
        }
    }
    return $false
}

function Expand-Any($file, $dest) {
    if ([IO.Path]::GetExtension($file) -ieq ".zip") { Expand-ZipNet $file $dest; return $true }
    return (Expand-WithTar $file $dest)
}

function Find-NexusArchive($modId) {
    # 넥서스 파일 이름은 '이름-모드번호-버전-시각.확장자' 형식
    $rx = "-$modId-[0-9A-Za-z\-]+( \(\d+\))?\.(zip|rar|7z)$"
    $dirs = @((Join-Path $Work "nexus"), $Downloads)
    foreach ($d in $dirs) {
        if (-not (Test-Path -LiteralPath $d)) { continue }
        $hit = Get-ChildItem -LiteralPath $d -File -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -match $rx -and $_.Length -gt 0 -and -not (Test-Path -LiteralPath ($_.FullName + ".part")) } |
            Sort-Object LastWriteTime -Descending | Select-Object -First 1   # 받는 중인 파일(.crdownload/.part)은 제외
        if ($hit) { return $hit.FullName }
    }
    return $null
}

function Read-Manifest($path) {
    try { return (Get-Content -LiteralPath $path -Raw -Encoding UTF8 | ConvertFrom-Json) } catch { return $null }
}

function Test-ModDependencies($modsDir) {
    $manifests = Get-ChildItem -LiteralPath $modsDir -Recurse -Filter "manifest.json" -Depth 4 -ErrorAction SilentlyContinue
    $have = @{}
    $parsed = @()
    foreach ($f in $manifests) {
        $m = Read-Manifest $f.FullName
        if (-not $m -or -not $m.UniqueID) {
            # 주석이 든 매니페스트는 여기서 못 읽을 수 있다. ID 만 뽑아 '설치됨'으로 친다
            $raw = Get-Content -LiteralPath $f.FullName -Raw -Encoding UTF8
            $idMatch = [regex]::Match($raw, '"UniqueID"\s*:\s*"([^"]+)"')
            if ($idMatch.Success) { $have[$idMatch.Groups[1].Value.ToLower()] = $f.DirectoryName }
            Note "매니페스트를 자세히 읽지 못해 ID 만 확인: $($f.FullName)"
            continue
        }
        $id = ([string]$m.UniqueID).ToLower()
        if ($have.ContainsKey($id)) { Warn "같은 모드가 두 번 설치됨: $($m.Name)  ->  $($have[$id])  /  $($f.DirectoryName)" }
        else { $have[$id] = $f.DirectoryName }
        $parsed += $m
    }
    $missing = 0
    foreach ($m in $parsed) {
        $needs = @()
        if ($m.ContentPackFor -and $m.ContentPackFor.UniqueID) { $needs += [string]$m.ContentPackFor.UniqueID }
        foreach ($d in @($m.Dependencies)) {
            if ($d -and $d.UniqueID -and ($d.IsRequired -ne $false)) { $needs += [string]$d.UniqueID }
        }
        foreach ($n in $needs) {
            if (-not $have.ContainsKey($n.ToLower())) { Warn "'$($m.Name)' 에 필요한 모드가 없습니다: $n"; $missing++ }
        }
    }
    Note "모드 $($parsed.Count)개 점검, 빠진 선행 모드 $missing 건"
    return $missing
}

function Show-SmapiLog {
    $log = Join-Path $env:APPDATA "StardewValley\ErrorLogs\SMAPI-latest.txt"
    if (-not (Test-Path -LiteralPath $log)) { Die "SMAPI 로그가 없습니다. 게임을 SMAPI 로 한 번 실행한 뒤 다시 확인하세요. ($log)" }
    $lines = Get-Content -LiteralPath $log -Encoding UTF8
    Say "SMAPI 로그 요약 ($log)"
    $loaded = $lines | Where-Object { $_ -match "Loaded \d+ (mods|content packs)" }
    foreach ($l in $loaded) { Note ($l -replace '^\[[^\]]*\]\s*', '') }
    $bad = $lines | Where-Object { $_ -match "\b(ERROR|ALERT)\b" -or $_ -match "Skipped mods" -or $_ -match "because it needs|is no longer compatible|couldn't be loaded" }
    if ($bad) {
        Warn "문제로 보이는 줄 (최대 60줄):"
        $bad | Select-Object -First 60 | ForEach-Object { Write-Host "   $_" -ForegroundColor Yellow }
        Note "이 내용을 그대로 복사해 전달하면 원인을 찾을 수 있습니다."
    } else {
        Note "오류나 건너뛴 모드가 없습니다."
    }
}

if ($CheckLog) { Show-SmapiLog; exit 0 }

# ---------------------------------------------------------------- 1. 게임 폴더
Say "1/7 스타듀밸리 설치 폴더 찾기"
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
New-Item -ItemType Directory -Force -Path (Join-Path $Work "nexus") | Out-Null

# ---------------------------------------------------------------- 2. SMAPI
Say "2/7 SMAPI 설치"
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
    Expand-ZipNet $smapiZip $smapiDir
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

# ---------------------------------------------------------------- 3. 넥서스 모드
Say "3/7 넥서스 모드 설치 ($($NexusMods.Count)개)"
if ($SkipNexus) {
    Note "-SkipNexus 옵션으로 건너뜁니다."
} else {
    $todo = @($NexusMods | Where-Object { -not (Test-Path -LiteralPath (Join-Path $mods $_.Marker)) })
    Note "이미 설치됨: $($NexusMods.Count - $todo.Count)개, 설치할 것: $($todo.Count)개"

    if ($todo.Count -gt 0) {
        $needDownload = @($todo | Where-Object { -not (Find-NexusArchive $_.Id) })
        if ($needDownload.Count -gt 0) {
            Note "넥서스 로그인이 필요합니다. 'Bara', 'Enti' 모드는 성인 콘텐츠 표시를 계정 설정에서 켜야 받을 수 있습니다."
            if (-not $NexusKey) {
                Note "넥서스 프리미엄이면 개인 API 키를 넣으면 전부 자동으로 받습니다."
                Note "(넥서스 사이트 > 계정 설정 > API Keys 맨 아래 'Personal API Key'. 무료 계정이면 그냥 Enter)"
                $NexusKey = (Read-Host "   넥서스 API 키").Trim()
            }
            $premium = $false
            $hdr = @{ "apikey" = $NexusKey; "User-Agent" = "sae-installer/1.0" }
            if ($NexusKey) {
                try {
                    $me = Invoke-RestMethod -Uri "https://api.nexusmods.com/v1/users/validate.json" -Headers $hdr
                    $premium = [bool]$me.is_premium
                    if (-not $premium) { Note "무료 계정이라 자동 다운로드가 안 됩니다. 브라우저 방식으로 진행합니다." }
                } catch { Warn "API 키 확인에 실패했습니다. 브라우저 방식으로 진행합니다." }
            }

            if ($premium) {
                foreach ($mod in $needDownload) {
                    try {
                        $links = Invoke-RestMethod -Uri "https://api.nexusmods.com/v1/games/stardewvalley/mods/$($mod.Id)/files/$($mod.File)/download_link.json" -Headers $hdr
                        $uri = @($links)[0].URI
                        $ext = [IO.Path]::GetExtension(([Uri]$uri).AbsolutePath)
                        $out = Join-Path $Work ("nexus\mod-{0}-{1}{2}" -f $mod.Id, $mod.File, $ext)
                        Note "내려받는 중: $($mod.Name)"
                        Get-File $uri $out
                    } catch { Warn "자동 다운로드 실패: $($mod.Name)  ($($_.Exception.Message))" }
                }
                $needDownload = @($todo | Where-Object { -not (Find-NexusArchive $_.Id) })
            }

            if ($needDownload.Count -gt 0) {
                Note "브라우저에 다운로드 페이지 $($needDownload.Count)개를 엽니다. 각 페이지에서 'Slow download' 를 누르세요."
                Note "파일은 다운로드 폴더($Downloads)에 그대로 두면 됩니다."
                foreach ($mod in $needDownload) {
                    Start-Process "https://www.nexusmods.com/stardewvalley/mods/$($mod.Id)?tab=files&file_id=$($mod.File)"
                    Start-Sleep -Milliseconds 1500
                }
                $lastCount = -1
                while ($true) {
                    $left = @($needDownload | Where-Object { -not (Find-NexusArchive $_.Id) })
                    if ($left.Count -eq 0) { break }
                    if ($left.Count -ne $lastCount) {
                        Note "남은 파일 $($left.Count)개: $(($left | ForEach-Object { $_.Name }) -join ', ')"
                        Note "(다 받지 않고 넘어가려면 Enter)"
                        $lastCount = $left.Count
                    }
                    $skip = $false
                    try { if ([Console]::KeyAvailable -and ([Console]::ReadKey($true).Key -eq "Enter")) { $skip = $true } } catch { }
                    if ($skip) { break }
                    Start-Sleep -Seconds 2
                }
                Start-Sleep -Seconds 2   # 마지막 파일 쓰기가 끝나길 잠깐 기다림
            }
        }

        foreach ($mod in $todo) {
            $archive = Find-NexusArchive $mod.Id
            if (-not $archive) { Warn "받지 못해 건너뜀: $($mod.Name)"; continue }
            $ok = $false
            try { $ok = Expand-Any $archive $mods } catch { Warn "압축 풀기 오류: $($_.Exception.Message)" }
            if ($ok -and (Test-Path -LiteralPath (Join-Path $mods $mod.Marker))) {
                Note "설치: $($mod.Name)"
            } elseif ($ok) {
                Warn "압축은 풀었지만 예상한 파일이 없습니다 (모드가 갱신되어 폴더 이름이 바뀌었을 수 있음): $($mod.Name)"
            } else {
                Warn "압축을 풀지 못했습니다: $archive"
                Note "rar 파일은 7-Zip(https://www.7-zip.org)을 설치한 뒤 다시 실행하면 됩니다."
            }
        }
    }
}

# ---------------------------------------------------------------- 4. SAE V2
$dest = Join-Path $mods $SaeFolder
if ($SkipSae) {
    Say "4/7 Stardew AI Expanded V2 (-SkipSae 옵션으로 건너뜀)"
} elseif (Test-Path -LiteralPath (Join-Path $dest "manifest.json")) {
    Say "4/7 Stardew AI Expanded V2"
    Note "이미 설치되어 있어 건너뜁니다. 다시 설치하려면 '$dest' 폴더를 다른 곳으로 옮긴 뒤 실행하세요."
} else {
    Say "4/7 Stardew AI Expanded V2 내려받기 (약 540MB, 몇 분 걸립니다)"
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
    # 압축 파일의 최상위 폴더가 'Stardew AI Expanded' 이므로 Mods 에 바로 푼다
    if (-not (Expand-WithTar $saeZip $mods)) { Expand-ZipNet $saeZip $mods }
    if (-not (Test-Path -LiteralPath (Join-Path $dest "manifest.json"))) { Die "압축을 풀었지만 '$dest\manifest.json' 이 없습니다." }
    Note "설치 위치: $dest"
}

# ---------------------------------------------------------------- 5. 설정
Say "5/7 오픈라우터 키와 모델 설정"
if (-not (Test-Path -LiteralPath $dest)) {
    Note "Stardew AI Expanded 가 설치되지 않아 건너뜁니다."
} else {
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
    $hasKey = [bool]($cfg.PSObject.Properties["OpenRouterApiKey"] -and $cfg.OpenRouterApiKey)
    $hasModel = [bool]($cfg.PSObject.Properties["Model"] -and $cfg.Model)

    if (-not $Model -and $hasKey -and $hasModel) {
        Note "이미 설정되어 있습니다 (모델: $($cfg.Model)). 바꾸려면 -Model 옵션을 쓰거나 config.json 을 고치세요."
    } else {
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

        if (-not $SkipKey -and -not $hasKey) {
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
    }
}

# ---------------------------------------------------------------- 6. 바로가기
Say "6/7 바탕화면 바로가기"
try {
    $lnk = Join-Path ([Environment]::GetFolderPath("Desktop")) "Stardew Valley (SMAPI).lnk"
    $sc = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk)
    $sc.TargetPath = $smapiExe
    $sc.WorkingDirectory = $game
    $sc.Save()
    Note "만들었습니다: $lnk"
} catch { Warn "바로가기를 만들지 못했습니다. '$smapiExe' 를 직접 실행하세요." }

# ---------------------------------------------------------------- 7. 점검
Say "7/7 선행 모드 점검"
$missing = Test-ModDependencies $mods

Say "끝났습니다"
if ($missing -gt 0) { Warn "빠진 선행 모드가 있습니다. 위 [주의] 줄을 확인하고 이 스크립트를 다시 실행하세요." }
Note "스타듀밸리는 모드 순서를 직접 정렬할 필요가 없습니다. SMAPI 가 선행 모드 관계를 보고 불러오는 순서를 정합니다."
Note "바탕화면의 'Stardew Valley (SMAPI)' 로 게임을 한 번 실행한 뒤, check.bat 으로 로그를 확인하세요."
Note "임시 파일($Work)은 문제없이 설치된 뒤 지워도 됩니다."
