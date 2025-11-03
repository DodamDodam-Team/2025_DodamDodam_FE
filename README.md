# 도담도담 FE

<img width="7680" height="4320" alt="Image" src="https://github.com/user-attachments/assets/11cfecda-ca60-475a-856b-d9bb4f7b808c" />

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
├── app.dart                                // 앱 시작 점
├── main.dart                               // 프로그램 시작
├── config/                                 // 앱 기본 설정
│   ├── constants.dart
│   ├── router.dart
│   └── theme.dart
├── model/                                  // DTO
│   ├── monthly_record.dart
│   ├── monthly_record.g.dart
│   ├── reading_record.dart
│   ├── reading_record.g.dart
│   ├── user.dart
│   └── user.g.dart
├── repository/                             //API 기본 통신 함수
│   ├── http_repository.dart
│   └── http_repository.g.dart
├── service/                                // 기타 관리 도구
│   └── secure_storage.dart
├── view/                                   // 화면
│   ├── custom_check_box.dart
│   └── main_pages/
│       ├── custom_bottom_navigation_bar.dart
│       ├── main_page.dart
│       ├── book_store/
│       │   └── book_store.dart
│       ├── community/
│       │   └── community.dart
│       ├── home/
│       │   ├── calendar.dart
│       │   ├── card.dart
│       │   ├── home.dart
│       │   ├── reading_rate_announce.dart
│       │   ├── reading_record.dart
│       │   └── user_reading_info.dart
│       ├── profile/
│       │   └── profile.dart
│       └── onboarding/
│           ├── join.dart
│           ├── login.dart
│           └── onboarding.dart
└── view_model/                              // API 연동 부, 비즈니스 로직 구현
    ├── auth_view_model.dart
    └── auth_view_model.g.dart
```
