# 도담도담 FE

## 사용 기술
  ### 언어
  - Dart

  ### 프레임 워크
  - Flutter


## 프로젝트 구조
### Dependencies
```
dependencies:
  flutter:
    sdk: flutter
  flutter_dotenv: ^6.0.0
  go_router: ^16.2.1
  flutter_secure_storage: ^9.2.4
  flutter_riverpod: ^3.0.0
  riverpod_annotation: ^3.0.0

dev_dependencies:
  build_runner: ^2.5.4
  custom_lint: ^0.7.6
  riverpod_generator: ^3.0.0
  riverpod_lint: ^3.0.0
```

### 파일 구조
```
lib/
├── config/              # 앱의 설정 관련 파일
│   ├── colors.dart
│   ├── router.dart
│   └── theme.dart
│
├── model/               # 데이터 모델 및 데이터 소스
│
├── repository/          
│       └── http_repository.dart
│
├── view/                # UI(화면)를 구성하는 파일
│   ├── main_pages/
│   │   ├── book_store/
│   │   │   └── book_store.dart
│   │   ├── community/
│   │   │   └── community.dart
│   │   ├── home/
│   │   │   └── home.dart
│   │   ├── profile/
│   │   │   └── profile.dart
│   │   ├── custom_bottom_navigation_bar.dart
│   │   └── main_page.dart
│   │
│   └── onboarding/
│       ├── join.dart
│       ├── login.dart
│       └── onboarding.dart
│
├── view_model/          # View와 Model을 연결하는 비즈니스 로직
│
├── app.dart             # 앱의 루트 위젯 (MaterialApp 등)
└── main.dart            # 앱의 시작점
```
