# My Way Home - 개발 계획서

프로젝트 개요
- 앱 이름: My Way Home
- 목적: 사용자가 하루 중 필요한 교통·주식 정보를 시간대별로 한눈에 확인할 수 있도록 대시보드 형태로 제공
- 대상: 출퇴근 시간대 실시간 교통정보와 주식 현황을 자주 확인하는 일반 모바일 사용자

핵심 기능
- Dashboard: 요약 정보(다음 출발 교통편, 핵심 종목 현재가)를 카드 형태로 표시
- Traffic: 판교역 출발 시간(경강선)과 주요 버스/지하철 도착/출발 예정시간을 카드 목록으로 표시
- Stock: 삼성전자, KODEX200의 실시간 현재가와 봉차트 표시
- Settings: 공공API 키 저장, 관심 정류소/정거장 설정, 표시할 주식 종목 설정

UI/UX 개념
- 모바일 일반 사이즈(세로) 우선 설계
- 좌측 Drawer에 3개 메뉴: Dashboard, Traffic, Stock (머티리얼 아이콘 사용)
- 상단 AppBar에 앱 타이틀, 오른쪽에 설정 및 로그인 아이콘 배치
- 카드 확장/축소(엑스팬드/콜랩스)로 상세 정보 표시

데이터 소스
- 대중교통: 공공데이터포털(예: 버스/지하철 API) — API 키 필요
- 철도: 국철/지하철 실시간 정보(가능한 경우) — 판교역 경강선 집중
- 주식: 증권사/금융 데이터 API(예: 한국거래소 또는 금융 데이터 제공사)

폴더 구조 제안
- my_way_home/
  - lib/
    - models/
    - screens/
      - dashboard/
      - traffic/
      - stock/
      - settings/
    - services/  # API 통신 및 데이터 파서
    - utils/
    - widgets/   # 공통 위젯(카드, 차트 래퍼 등)

개발 순서(마일스톤)
1. 프로젝트 초기화 및 폴더 구조 생성
2. 기본 라우팅 및 Drawer + AppBar UI 골격 구현
3. Settings 화면(로컬 저장/API 키 입력) 구현
4. Traffic 화면: 판교역 경강선 기본 카드 구현 및 더미 데이터 연결
5. Stock 화면: 실시간 현재가 표시 및 봉차트 위젯 연동(더미/샘플 데이터)
6. API 연동 및 실시간 데이터 반영
7. Dashboard에 요약 카드 집계
8. 테스트, 문서화, dev-history에 변경기록 남기기

## 상세 개발 체크리스트

### Phase 1: 개발 환경 준비
- [ ] pubspec.yaml에 필수 의존성 추가
  - [ ] provider (상태관리)
  - [ ] intl (시간 포맷)
  - [ ] fl_chart (주식 차트)
  - [ ] shared_preferences (로컬 저장)
  - [ ] http (API 통신)
- [ ] flutter pub get 실행
- [ ] main.dart 생성 및 MaterialApp 설정
- [ ] 라우팅 정의 (4개 화면)

### Phase 2: UI 골격 구축
- [ ] AppBar 구현
  - [ ] 타이틀 표시
  - [ ] 설정 아이콘 추가
  - [ ] 로그인 아이콘 추가
- [ ] Drawer 네비게이션 구현
  - [ ] Dashboard 메뉴
  - [ ] Traffic 메뉴
  - [ ] Stock 메뉴
  - [ ] 머티리얼 아이콘 적용
- [ ] 4개 화면 골격 생성
  - [ ] screens/dashboard_screen.dart (더미 UI)
  - [ ] screens/traffic_screen.dart (더미 UI)
  - [ ] screens/stock_screen.dart (더미 UI)
  - [ ] screens/settings_screen.dart (더미 UI)
- [ ] 네비게이션 라우팅 동작 확인

### Phase 3: 데이터 모델 정의
- [ ] models/traffic_model.dart 작성
  - [ ] 버스/지하철 정보 구조
  - [ ] 도착/출발 시간 필드
  - [ ] 역/정류소 정보
- [ ] models/stock_model.dart 작성
  - [ ] 종목 정보 구조
  - [ ] 현재가, 변화량 필드
  - [ ] 일일 데이터 구조 (봉차트용)
- [ ] models/settings_model.dart 작성
  - [ ] API 키 저장 구조
  - [ ] 사용자 설정 필드

### Phase 4: 기본 기능 구현
- [ ] Settings 화면 - SharedPreferences 연동
  - [ ] 공공 API 키 입력 필드
  - [ ] 선호 정류소/정거장 설정
  - [ ] 선호 주식 종목 설정
  - [ ] 저장 및 로드 기능
- [ ] Traffic 화면 - 더미 데이터 표시
  - [ ] 카드 UI 구현
  - [ ] 샘플 데이터 3개 이상 표시
  - [ ] 확장/축소 기능 (ExpansionTile)
  - [ ] 상세 정보 표시
- [ ] Stock 화면 - 더미 데이터 및 차트
  - [ ] 카드 UI 구현
  - [ ] 현재가 표시
  - [ ] fl_chart 연동하여 봉차트 표시
  - [ ] 샘플 데이터 (삼성전자, KODEX200)
- [ ] Dashboard 화면 - 요약 정보 집계
  - [ ] 다음 출발 교통편 카드
  - [ ] 핵심 종목 현재가 카드
  - [ ] Traffic/Stock 데이터와 연동

### Phase 5: 테스트 및 문서화
- [ ] 기능 테스트
  - [ ] 화면별 라우팅 동작 확인
  - [ ] Drawer 네비게이션 정상 작동
  - [ ] Settings 로컬 저장 확인
  - [ ] 카드 확장/축소 애니메이션 동작
- [ ] UI/UX 검증
  - [ ] 아이콘/레이블 일치 여부
  - [ ] 단말 크기별 반응형 확인 (가로/세로)
  - [ ] 텍스트 가독성 확인
- [ ] dev-history 업데이트
  - [ ] 2026-05-30 진행 기록 추가
  - [ ] 완성된 기능 문서화
  - [ ] 다음 단계 정의
- [ ] README.md 최종 업데이트

수락 기준
- 앱 실행 시 기본 대시보드 화면 로드
- 좌측 Drawer를 통해 세 화면으로 이동 가능
- Traffic 화면에 판교역 더미/테스트 데이터 카드 3개 이상 표시
- Stock 화면에 삼성전자와 KODEX200의 샘플 차트 및 현재가 표시

다음 작업(우선 순위)
1. 레포지토리에 기본 Flutter 프로젝트 스캐폴드 추가
2. `dev-history/`에 초기 계획 기록

---
작성일: 2026-05-21
