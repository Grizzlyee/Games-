# 스타듀밸리 모드 자동 설치 (AI 대화 모드 + 스크린샷의 모드 목록)

윈도우 PC 전용. 스타듀밸리(Steam 또는 GOG)가 설치되어 있어야 한다.

## 실행

1. 이 폴더의 `install.bat`, `install.ps1`, `check.bat` 세 파일을 PC의 같은 폴더에 받는다.
2. 게임을 끄고 `install.bat`을 더블클릭한다.
3. 넥서스 모드 단계에서
   - 프리미엄 계정이면 개인 API 키를 넣는다 → 전부 자동으로 받는다.
   - 무료 계정이면 Enter → 브라우저에 다운로드 페이지가 열리고, 각 페이지에서 `Slow download`를 누르면 스크립트가 다운로드 폴더에서 파일을 찾아 설치한다.
4. 모델 번호를 고르고 오픈라우터 키(`sk-or-...`)를 붙여넣는다.
5. 바탕화면의 `Stardew Valley (SMAPI)`로 게임을 한 번 실행한 뒤 `check.bat`으로 로그를 확인한다.

중간에 끊겨도 다시 실행하면 이미 설치된 것은 건너뛴다.

## 설치하는 모드

| 모드 | 넥서스 번호 | 비고 |
|---|---|---|
| SMAPI | (GitHub) | 최신판 무인 설치 |
| Content Patcher 2.9.1 | 1915 | 선행 |
| Generic Mod Config Menu 1.16.0 | 5098 | 선행 |
| Farm Type Manager 1.26.1 | 3231 | SVE 선행 |
| Sprites in Detail 0.6.1 | 14487 | Bara Anthro XL 선행 |
| Stardew Valley Expanded 1.15.11 | 3753 | |
| Anthro Characters Continued 11.3.0 | 1083 | |
| Alternate Anthro Andy 1.0.1 | 24727 | SVE 필요 |
| Hakan NPC 0.9.6 | 26541 | |
| Hakan NPC 한국어 패치 1.0 | 28225 | Hakan 폴더에 `i18n/ko.json`을 덧씌움. Hakan 뒤에 설치 |
| Bara Anthro Characters | 22977 | 성인 표시, rar |
| Enti's Furry Barafications 1.2 | 24846 | **스크린샷에 없던 선행 모드.** XL과 Supplement가 요구. 성인 표시 |
| Bara Anthro XL 1.13 | 44387 | 스크린샷의 BaraValleyXL. 성인 표시 |
| Bara Anthro Character Supplement 1.1.3 | 30064 | 성인 표시 |
| Bara Anthro Shane 1.1.3 | 26738 | 성인 표시, rar |
| Bara Anthro Alex 1.1.0 | 29085 | 성인 표시, rar |
| Bara Anthro Giant Crop 1.1.0 | 30778 | 성인 표시, rar |
| StardewAIExpanded Extended Input 1 | 52692 | Stardew AI Expanded 필요 |
| Stardew AI Expanded V2 | (구글 드라이브) | 디시 글 283943 / 285961 |

- 성인 표시 모드는 넥서스 계정 설정에서 성인 콘텐츠 표시를 켜야 받을 수 있다.
- rar 파일은 윈도우 내장 `tar`로 풀고, 안 되면 7-Zip이 필요하다.
- 스크린샷 맨 아래의 `Extended Bara Furry Valley`는 모드가 아니라 Vortex 컬렉션 항목이라 설치 대상이 아니다.

## 정렬(로드 순서)

스타듀밸리는 직접 정렬할 필요가 없다. SMAPI가 각 모드의 선행 관계를 보고 불러오는 순서를 정한다.
파일을 덮어쓰는 관계는 Hakan 한국어 패치 하나뿐이고, 스크립트가 Hakan 뒤에 설치한다.
설치가 끝나면 스크립트가 모든 모드의 선행 모드가 있는지 점검한다.

## 출처와 확인 상태 (2026-11-21)

- 모드 번호, 파일, 선행 조건, 압축 파일 내부 구조: 넥서스 공개 API로 확인
- AI 모드: 디시 스타듀밸리 갤러리 글 279849, 283943, 285961, 키 발급 글 280005
- AI 모드 파일 해시(SHA256): `ab013b7808eaa6346f1739283ba7ab52c86664de926e35dd970dd57a6a688b28`. 해시가 다르면 스크립트가 묻는다
- 이 스크립트는 리눅스에서 작성했고 **윈도우에서 실제로 실행해 보지 않았다.** 오류가 나면 메시지를 그대로 전달할 것
- 넥서스 프리미엄 자동 다운로드 경로는 키가 없어 시험하지 못했다
