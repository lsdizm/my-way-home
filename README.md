# My Way Home

## 프로젝트 개요
My Way Home은 사용자가 하루 중 필요한 교통·주식 정보를 시간대별로 한눈에 확인할 수 있는 Flutter 기반 대시보드 앱입니다.
출퇴근 시간대 실시간 교통정보와 주식 현황을 자주 확인하는 사용자를 위해, 카드 기반 UI로 빠르고 직관적인 정보 제공을 목표합니다.
판교역 경강선, 주요 버스/지하철, 그리고 핵심 주식 종목(삼성전자, KODEX200)의 정보를 대시보드에 집계하여 표시합니다.
좌측 Drawer 네비게이션을 통해 Dashboard, Traffic, Stock, Settings 화면으로 이동 가능하며, 사용자가 API 키와 관심 종목을 설정할 수 있습니다.

**현재 진행상황**: ✅ **Phase 1~5 완료** (기본 구조 및 더미 데이터 연동 완료, API 연동 대기)

## 🎯 핵심 기능

| 화면 | 설명 | 상태 |
|------|------|------|
| **Dashboard** | 요약 정보 (다음 출발편, 핵심 종목) | ✅ 완료 |
| **Traffic** | 판교역 경강선 및 버스/지하철 카드 목록 | ✅ 완료 |
| **Stock** | 주식 현재가 + fl_chart 그래프 | ✅ 완료 |
| **Settings** | API 키/선호 정류소/종목 설정 (SharedPreferences) | ✅ 완료 |

## 🏗️ 기술 스택
- **Framework**: Flutter (Material Design 3)
- **상태관리**: Provider 6.0.0 (향후)
- **차트**: FL Chart 0.66.0
- **로컬저장소**: SharedPreferences 2.2.0
- **HTTP**: http 1.1.0 (향후)

## 📂 프로젝트 구조
```
lib/
├── main.dart                      # 앱 진입점
├── models/                        # 데이터 모델
│   ├── traffic_model.dart        # 교통 정보
│   ├── stock_model.dart          # 주식 정보
│   └── settings_model.dart       # 사용자 설정
├── screens/                       # 화면
│   ├── dashboard_screen.dart
│   ├── traffic_screen.dart
│   ├── stock_screen.dart
│   └── settings_screen.dart
└── services/                      # 비즈니스 로직
    ├── traffic_service.dart      # 교통 데이터
    └── stock_service.dart        # 주식 데이터
```

## ✨ 구현 현황
- ✅ 4개 화면 완성 (Dashboard, Traffic, Stock, Settings)
- ✅ 더미 데이터 통합 (4개 교통편, 3개 주식)
- ✅ 서비스 계층 분리 (TrafficService, StockService)
- ✅ 모델 클래스 정의 (JSON 직렬화 지원)
- ✅ SharedPreferences 로컬 저장
- ✅ ExpansionTile 상세 정보 표시
- ✅ fl_chart 샘플 그래프

## 🚀 빠른 시작
```bash
# 의존성 설치
flutter pub get

# 앱 실행
flutter run

# 테스트
flutter test
```

## 📖 개발 문서
- [개발 계획서](dev-plan.md) - 상세 체크리스트
- [개발 히스토리](dev-history/) - Phase별 완료 기록

## 🔄 다음 단계
1. 공공데이터포털 API 연동 (교통 정보)
2. 금융 API 연동 (주식 정보)
3. Provider를 통한 상태관리 구현
4. 자동 갱신 타이머
5. 단위/통합 테스트

---
**개발 상태**: Ready for API Integration
**최종 업데이트**: 2026-05-30