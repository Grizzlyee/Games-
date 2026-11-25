# 새 세션 인계 자료: 스타듀밸리 모드 설치

작성일 2026-11-25. 이 문서는 게임이 설치된 **윈도우 PC에서 도는 Claude 세션**이 읽고 이어서 작업하기 위한 자료다.
모드 번호·파일·선행 조건·압축 파일 구조는 넥서스 공개 API(`api.nexusmods.com/v2/graphql`, 게임 id 1303)로 확인했다. 기계가 읽을 목록은 같은 폴더의 `mods.json`(90개, 등급별)에 있다.

## 1. 목표

사용자가 원하는 구성:

1. AI 대화 모드 **Stardew AI Expanded(SAE) V2** + Extended Input
2. **대확장(SVE)** 과 관련 모드
3. 스크린샷으로 지정한 모드 17개와 그 선행 모드
4. 필수 대규모·편의성·확장성 모드
5. **퍼리(수인)** 와 **Bara** 관련 모드
6. **주민을 모두 남자로** 바꾸는 구성

사용자는 한국어 사용자이고 넥서스 **무료 계정**이다. 스타듀밸리 설치 여부는 확인되지 않았다.

## 2. 아직 확인되지 않은 것 (먼저 확인할 것)

| 항목 | 상태 |
|---|---|
| 스타듀밸리 설치 여부와 게임 버전 | 미확인. `Stardew Valley.dll`이 있는 폴더를 찾을 것 |
| `install.ps1` | 리눅스에서 작성. **윈도우에서 한 번도 실행하지 않음** |
| 넥서스 프리미엄 API 다운로드 경로 | 키가 없어 시험하지 못함 |
| 이 모드 조합으로 게임이 정상 구동되는지 | 미확인. SMAPI 로그로 확인해야 함 |
| Claude 모델이 SAE에서 동작하는지 | 미확인. 작성자는 Gemini만 시험. SAE는 `temperature`를 보내는데 오픈라우터의 Claude 지원 매개변수 목록에는 없음 |
| SAE 디시 글 댓글(약 190개) | 읽지 못함 |
| Bara XL이 이름·대사까지 남성으로 바꾸는지 | 미확인. 그림 파일 목록만 확인함 |
| 번역 모드 일부의 압축 구조 | `mods.json`에서 `marker`가 `null`인 것은 구조 미확인. 풀기 전에 내용을 볼 것 |

## 3. 이미 준비된 것

- `install.bat` / `install.ps1`: 게임 폴더 탐지 → SMAPI 설치 → 넥서스 모드 17개 → SAE V2 → `config.json` → 바로가기 → 선행 모드 점검
- `check.bat`: 게임을 한 번 실행한 뒤 SMAPI 로그에서 오류와 건너뛴 모드를 뽑아 보여 줌
- `mods.json`: 아래 등급 전체의 모드 번호, 파일 번호, 파일 이름, 설치 후 생기는 `marker` 경로, 선행 모드

`install.ps1`의 `$NexusMods` 배열에 `mods.json` 항목을 같은 형식(`Name`, `Id`, `File`, `Marker`)으로 추가하면 설치 대상이 늘어난다. 오류가 나면 스크립트를 고쳐 쓰면 된다.

## 4. 넥서스 다운로드 규칙

- 무료 계정은 사이트에서 `Slow download`를 직접 눌러야 한다. 다운로드 페이지 주소: `https://www.nexusmods.com/stardewvalley/mods/<모드번호>?tab=files&file_id=<파일번호>`
- 받은 파일 이름은 `이름-<모드번호>-<버전>-<시각>.zip` 형식이다. 스크립트는 다운로드 폴더에서 `-<모드번호>-`로 찾는다.
- 성인 표시(`adult: true`) 모드는 넥서스 계정 설정에서 성인 콘텐츠 표시를 켜야 받을 수 있다.
- 사용자의 넥서스 비밀번호를 받아 대신 로그인하지 말 것. 로그인은 사용자가 브라우저에서 직접 한다.
- 대기 시간이나 속도 제한을 우회하는 방법은 쓰지 말 것.
- `rar` 파일은 윈도우 내장 `tar`로 풀고, 안 되면 7-Zip이 필요하다.

## 5. 설치 규칙

- 대부분의 모드는 압축을 `Mods` 폴더에 그대로 풀면 된다(최상위 폴더 안에 `manifest.json`).
- **로드 순서를 직접 정렬할 필요가 없다.** SMAPI가 `manifest.json`의 선행 관계로 순서를 정한다.
- **덧씌우기 모드는 원본 뒤에 설치한다.** 번역 모드 중 `manifest.json`이 없는 것은 원본 모드 폴더에 `i18n/ko.json` 같은 파일을 얹는 방식이다. 확인된 예: Hakan 한국어 패치는 `[CP] Haki_Stardew/i18n/ko.json` 한 파일.
- 같은 그림을 바꾸는 모드를 둘 이상 넣으면 한쪽이 가려진다. 6절의 충돌 표를 볼 것.
- 설치 후 게임을 SMAPI로 한 번 실행하고 `check.bat`으로 로그를 확인한다.
- 농장 맵 모드는 새 세이브에서만 적용된다.

## 6. 모드 구성

### 6.1 기반 (필수)

| 모드 | 번호 | 필요한 곳 |
|---|---|---|
| SMAPI 4.5.2 | GitHub | 전부 |
| Content Patcher 2.9.1 | 1915 | 거의 전부 |
| Generic Mod Config Menu 1.16.0 | 5098 | 게임 안 설정. ACC·Bara 토글에 필요 |
| Farm Type Manager 1.26.1 | 3231 | SVE |
| SpaceCore 1.28.4 | 1348 | 다른 확장(RSV, East Scarp 등)과 일부 모드 |
| Sprites in Detail 0.6.1 | 14487 | Bara Anthro XL |

### 6.2 사용자 지정 목록 (스크린샷)

SVE 1.15.11(3753), Anthro Characters Continued 11.3.0(1083), Alternate Anthro Andy(24727), Hakan NPC 0.9.6(26541), Hakan 한국어 패치(28225), Bara Anthro Characters(22977), Bara Anthro XL 1.13(44387, 스크린샷의 BaraValleyXL), Bara Anthro Character Supplement 1.1.3(30064), Bara Anthro Shane(26738), Bara Anthro Alex(29085), Bara Anthro Giant Crop(30778), StardewAIExpanded Extended Input(52692).

- **스크린샷에 없던 필수 선행 모드: Enti's Furry Barafications(24846).** XL과 Supplement가 요구한다. 추가했다.
- 스크린샷 맨 아래의 `Extended Bara Furry Valley`는 Vortex 컬렉션 항목이다. 넥서스에서 같은 이름의 공개 컬렉션은 찾지 못했다.
- Hakan 한국어 패치는 2024-09, 본체는 2025-11이라 새 대사는 영어로 나올 수 있다.

### 6.3 대확장(SVE) 관련

| 모드 | 번호 | 비고 |
|---|---|---|
| Stardew Valley Expanded Korean 1.15.11 | 8633 | **한국어 사용자에게 사실상 필수.** 추천 2,681. 압축 구조 미확인(덧씌우기일 가능성) |
| Furry Stardew Valley Expanded Continued 1.1.6 | 22271 | SVE 주민을 수인으로. 없으면 SVE 주민은 Andy만 빼고 사람 모습 |
| SVE 농장 맵(선택, 하나만) | 3753의 선택 파일 | Grandpa's Farm(파일 136000), Immersive Farm 2 Remastered(136001), Frontier Farm(135999). 새 세이브 필요 |
| SAE용 SVE 로어팩 | 구글 드라이브 | 7절 참고. SVE를 쓰면 SAE 작성자가 설치를 권장 |

### 6.4 편의성 (기본 추천)

모두 SMAPI만 있으면 되고 서로 충돌이 알려진 것은 없다. `mods.json`의 `qol` 등급.

| 용도 | 모드(번호) |
|---|---|
| 지도·정보 | NPC Map Locations(239), Lookup Anything(541), UI Info Suite 2(7098), Data Layers(1691), Range Highlight(6752), Experience Bars(509), CJB Show Item Sell Price(5) |
| 선물·이벤트 | Gift Taste Helper Continued x2(21001), Event Lookup(8505) |
| 자동화·보관 | Automate(1063), Chests Anywhere(518), Better Crafting(11115), Convenient Inventory(10384) |
| 농사·목장 | Tractor Mod(1401), Better Ranching(859), Automatic Gates(3109), Passable Crops(15223) |
| 이동·시간 | Skull Cavern Elevator(963), Horse Flute Anywhere(7500), Fast Animations(1089), Skip Intro(533) |
| 기타 | Visible Fish(8897), To-Dew(7409) |

치트 성격이라 **선택**으로 둔 것(`cheat` 등급): CJB Cheats Menu(4), CJB Item Spawner(93), Noclip Mode(3900), TimeSpeed(169), Skip Fishing Minigame(2697), Wear More Rings(3214)와 Bigger Backpack(1845, 둘 다 StardewHack 3213 필요).

2024년 이후 갱신이 없는 것(UI Info Suite 2, Skull Cavern Elevator, Visible Fish, Event Lookup, Range Highlight, Bigger Backpack, Skip Fishing Minigame)은 로그에서 호환 여부를 볼 것.

### 6.5 퍼리(수인)

| 모드 | 번호 | 비고 |
|---|---|---|
| Anthro Characters Continued 11.3.0 | 1083 | 기반. 거의 모든 주민을 수인으로. 연애 가능 캐릭터 성별 전환 토글 내장 |
| Furry Stardew Valley Expanded Continued | 22271 | SVE 주민 수인화 |
| Alternate Anthro Andy | 24727 | SVE의 Andy를 곰으로 |
| Hakan NPC + 한국어 패치 | 26541, 28225 | 늑대 수인 신규 주민 |
| Furry Farmer 2.0.3 | 7618 | 플레이어 캐릭터 수인화. Fashion Sense(9969), FS - SH's Animals and Myths Pack(10324) 권장, No Blink(17220) 권장. 2024-03 갱신 |
| Furry Farmers (Fashion Sense Port) 0.9.3 | 34230 | 위의 대안. Fashion Sense(9969), 10324 필요. 둘 중 하나만 |
| Anthro Babies Expanded 1.2.3 | 9413 | 아이를 배우자 종에 맞춤. rar |
| ACC Animated Portrait 0.3 | 25540 | Content Patcher Animations(3853) 필요. Bara 초상화와 겹칠 수 있어 기본 제외 |

특정 모드 전용 수인 패치(해당 모드를 쓸 때만): Clint Reforged 패치(27474), Make Marlon Real 패치(16595), Ranch Expansion 패치(28048).

### 6.6 Bara

기본 구성(사용자 목록에 이미 있음): Bara Anthro Characters(22977) → Enti's Furry Barafications(24846) → Bara Anthro XL(44387) → Bara Anthro Character Supplement(30064). Supplement 설명문에 따르면 Supplement가 가장 높은 우선순위로 앞의 것들을 덮는다. 캐릭터별 그림은 게임 안 GMCM에서 켜고 끈다.

| 모드 | 번호 | 비고 |
|---|---|---|
| Bara Anthro Shane / Alex / Giant Crop | 26738, 29085, 30778 | 사용자 목록. rar |
| Bara Anthro Obelisk And Furniture | 26535 | 선택. Alternative Textures(9246) 필요. rar |
| Bara Anthro Bouncer 초상화 | 31567 | 선택. rar |
| Bara Alex Anthro Overhaul | 25898 | 선택. 29085와 같은 캐릭터라 **둘 중 하나만** |
| SFW Bara Anthro | 25073 | 22977의 수위 낮춘 대체판. **22977과 같이 넣지 말 것** |
| Kagami Sora 등의 개별 초상화 | 23990~24322 등 | 불필요. Supplement(30064)에 이미 합쳐져 있음 |
| Supplement to pornographic content | 28703 | 수위 높음. 기본 제외. 1083, 22977, 30064 필요 |
| Bara Anthro Horny Bachelors | 38904 | 수위 높음. 기본 제외. Horny Bachelors(2564), Horny Festivals(10844) 필요 |
| TJ의 스프라이트 수정본 | 25923, 29457, 26034 | 매니페스트 없는 낱개 파일. 기본 제외 |

수위 높은 두 모드는 사용자가 명시적으로 원할 때만 넣는다.

### 6.7 주민을 모두 남자로

퍼리·Bara 구성 안에서 해결한다.

1. **Bara Anthro XL(44387)**: 설명문에 "모든 성인을 Bara 수인 남성으로 바꾼다"고 적혀 있다. 그림 파일에 여성 주민도 포함된다: Abigail, Caroline, Emily, Evelyn, Haley, Jodi, Leah, Marnie, Maru, Pam, Penny, Robin. 아이 캐릭터(Jas, Vincent, Leo)는 대상이 아니다.
2. **ACC 내장 성별 전환 토글**: 타이틀 화면 톱니바퀴 → Anthro Characters Continued에서 연애 가능 여성 6명의 여→남 전환을 켠다. 설명문에 따르면 대사와 문구 변경이 포함된다. 남→여 전환(Alexis, Ellen, Hannah, Sabrina, Samantha, Shauna)은 끈 채로 둔다.
3. **Enti's(24846)와 Supplement(30064)**: 전환된 캐릭터(Hayden, Emil, Liam, Marcus, Perry, Albert)의 Bara 그림을 제공한다. 2번 토글을 켜야 맞는 구성이라는 것은 Enti's 설명문("여→남 전환 캐릭터만 있음")에 근거한 추론이다.

남는 빈틈:

- 연애 대상이 아닌 여성 주민(Caroline, Robin 등)은 XL이 그림을 바꾸지만, 이름·대사·호칭까지 바뀌는지는 확인하지 못했다.
- SVE의 여성 주민(Sophia, Olivia, Claire, Susan 등)을 남성화하는 모드는 찾지 못했다.

비퍼리 남성화 모드(46434, 46435, 44271, 9257, 9204)는 ACC·Bara와 같은 그림을 건드리므로 **같이 쓰지 않는다.** 9257, 9204는 2021~2022년 것이고 9204는 PyTK(1726)가 필요하다.

### 6.8 추가 대규모 확장 (선택)

**권장: 넣지 않거나 최소로.** 아래 확장은 사람 모습의 주민을 대량으로 추가하는데, 이들을 수인·남성으로 바꾸는 모드는 찾지 못했다. "전원 수인·전원 남성" 구성이 깨진다. 사용자에게 먼저 물을 것.

| 확장 | 번호 | 추가 선행 모드 | 한국어 |
|---|---|---|---|
| Ridgeside Village 2.5.17 | 7286 | Custom Companions(8626), SpaceCore | 8371 |
| East Scarp 3.0.9 | 5787 | Lumisteria Tilesheets Indoor(9599)·Outdoor(10448), MEEP(14493), HxW Tilesheets(20139), SpaceCore | 9278, 46121 (9278은 East Scarp NPC 모드 12개를 선행으로 요구) |
| Sunberry Village 1.1.2 | 11111 | 8626, 20139, 9599, Item Extensions(20357) | 32868 (Sunberry NPC 모드 6개 요구) |
| Visit Mount Vapius 2.0.0 | 9600 | EMP(9296), 20357, 9599, SpaceCore, Unlockable Bundles(17265), BETAS(27100), Custom Museum Framework(34530) | 36644는 1.3.4용이라 구버전 |
| Downtown Zuzu 0.9.4 | 8587 | 8626, SpaceCore, Mail Framework Mod(1536) 외 | 8739는 0.9.2용 |
| Cape Stardew 7.4.2 | 14635 | 20357, 17265, SpaceCore, Kimberlite Ore(22301), Secret Note Framework(25055), Minimap Project(29049) | 찾지 못함 |
| DeepWoods 4.3.1-beta | 2571 | 없음 | 해당 없음 |

## 7. Stardew AI Expanded (SAE)

출처: 디시 스타듀밸리 갤러리 글 279849(V1 소개), 283943(V2), 285961(소규모 업데이트), 280005(키 발급).

- 최신 파일: `https://drive.google.com/file/d/1Ism9-NLgD7NKiyxJ7V1tpMHwarfmea1e` (약 540MB). SHA256 `ab013b7808eaa6346f1739283ba7ab52c86664de926e35dd970dd57a6a688b28` (2026-11-21에 받은 파일).
- 압축 안의 `Stardew AI Expanded` 폴더를 `Mods`에 넣는다. 윈도우용 파이썬이 동봉되어 있어 **윈도우 전용**이다.
- 접속 주소가 `https://openrouter.ai/api/v1/chat/completions`로 고정이다. 다른 주소로 바꿀 수 없다.
- 익명 작성자가 개인 드라이브로 배포한다. 문자열·참조 수준의 정적 확인만 했고 전체 코드 감사는 하지 않았다.
- `config.json`은 첫 실행 때 생긴다. 주요 항목: `OpenRouterApiKey`, `Model`, `SummaryModel`, `MaxTokens`, `YellMaxTokens`, `DynamicLetterMaxTokens`, `Temperature`, `ReasoningEffort`, `StandaloneChatButton`, `EnableRawDialogueLogBackup`. 일부 항목만 적은 파일을 미리 두면 SMAPI가 나머지를 기본값으로 채운다.
- 작성자 안내: 답이 끊기면 `MaxTokens`와 `YellMaxTokens`를 늘린다. 축제에서 진행이 막히면 `StandaloneChatButton`을 우클릭이 아닌 다른 키로 바꾼다. 세이브를 오갈 때는 `data` 폴더를 백업한다.
- Extended Input(넥서스 52692)은 SAE 본체가 있어야 한다.

### SAE 로어팩

SAE는 팩이 있어야 추가 NPC가 누구인지 인식한다. 압축 최상위에 `manifest.json`이 바로 있으므로 **새 폴더를 만들어 그 안에** 풀어야 한다.

| 팩 | 구글 드라이브 파일 id | SHA256 (2026-11-25) |
|---|---|---|
| SVE용 | `1Oj5UFd5e0nxRV_gCE0C6MzFB-LodRAXQ` | `131c7ca3eb4acbb05f2d88706ef63a2f8faa4933e7b6dde483caccb610ad9974` |
| RSV용 (RSV를 넣을 때만) | `1CRM00mG74pqVN56Duc-qn65knMzhFfNp` | `8db3cdb0f50d16b65db9c638b993595e4a77d811969b3c454e891ba14d19e24c` |

받는 주소 형식: `https://drive.usercontent.google.com/download?id=<id>&export=download&confirm=t`. 현재 `install.ps1`은 로어팩을 설치하지 않는다.

### 이 구성에서 SAE가 어긋나는 지점

- **성별**: SAE의 `assets/vanilla-canon-lore.json`은 원작 기준(여성 주민은 여성)으로 적혀 있다. 주민을 남성으로 바꾸면 AI가 여전히 여성으로 묘사할 수 있다. 작성자 안내대로 이 파일에서 해당 주민의 설정을 고쳐야 한다. 사용자와 상의해 이름과 성격을 정할 것.
- **수인 외형**: 같은 이유로 AI는 주민을 사람으로 묘사한다. 필요하면 같은 파일에 외형을 적는다.
- **Hakan**: 신규 주민이라 팩이 없으면 SAE가 인식하지 못한다. `Stardew AI Expanded/templates/SAE_CustomNpcPack_Template`의 `README_NPC.md`를 따라 팩을 만든다.

### 키와 모델

- 사용자는 Claude Max 구독의 월 API 크레딧을 쓰고 싶어 한다. 공식 문서(`platform.claude.com/docs/en/about-claude/api-credits-for-subscribers`)에 따르면 claude.ai 결제 설정에서 Console 조직을 연결해야 하고, 신규 구독자는 7일 뒤부터 받을 수 있으며, 남은 크레딧은 매달 소멸한다. 금액($100)은 2차 출처 기준이다.
- 경로: Console에서 API 키 생성 → 오픈라우터 BYOK 설정에 Anthropic 키 등록 → SAE에는 오픈라우터 키(`sk-or-...`)를 넣는다. 오픈라우터를 거친 사용이 크레딧에서 차감된다는 것은 추론이다.
- 오픈라우터 BYOK 수수료는 5%이고 월 $25,000어치까지 면제다(오픈라우터 문서).
- 모델 id(오픈라우터, 2026-11-21 확인): `anthropic/claude-sonnet-5.5`($2/$10), `anthropic/claude-haiku-5.5`($0.10/$0.50), `google/gemini-3.8-flash`($0.83/$4.12). 단위는 100만 토큰당 입력/출력.
- 키 값을 채팅이나 저장소에 적지 말 것. `config.json`에만 넣는다.

## 8. 권장 작업 순서

1. 게임 설치와 버전 확인. 설치 폴더와 `Mods` 폴더 확인.
2. 사용자에게 두 가지를 묻는다: 6.8의 추가 확장을 넣을지, 6.6의 수위 높은 모드를 넣을지.
3. 넥서스 로그인(사용자가 직접)과 성인 콘텐츠 표시 설정 확인.
4. `install.bat` 실행. 오류가 나면 `install.ps1`을 고친다.
5. 6.3~6.5에서 고른 모드를 `mods.json` 기준으로 추가 설치. 번역 모드는 원본 뒤에.
6. SAE 로어팩(SVE용) 설치.
7. 게임을 SMAPI로 실행 → `check.bat`으로 로그 확인 → 빠진 선행 모드와 오류 해결.
8. GMCM에서 ACC 성별 전환 토글과 Bara 계열 토글 설정(6.7).
9. SAE 키·모델 설정 후 NPC와 대화해 응답이 오는지 확인. Claude 모델에서 오류가 나면 `google/gemini-3.8-flash`로 바꿔 원인이 모델인지 가린다.
10. `vanilla-canon-lore.json`의 성별·외형 설정과 Hakan 팩은 사용자와 상의해 진행.

## 9. 출처

- 넥서스 모드 페이지: `https://www.nexusmods.com/stardewvalley/mods/<번호>`
- SMAPI: `https://github.com/Pathoschild/SMAPI` (무인 설치 옵션 `--install --game-path "<경로>" --no-prompt`은 `docs/technical/smapi.md`에서 확인)
- SAE: `https://gall.dcinside.com/mgallery/board/view/?id=stardew&no=283943` 외 3개 글
- 오픈라우터 BYOK: `https://openrouter.ai/docs/guides/overview/auth/byok.md`
