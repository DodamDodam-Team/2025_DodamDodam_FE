import 'package:flutter/material.dart';

// 앱의 기본 테마 데이터를 정의합니다.
final ThemeData theme = ThemeData(
  // Material 3 디자인 시스템 활성화
  useMaterial3: true,

  /**
   * 
  // 2색상 스킴
  // 앱의 전체적인 색상 톤을 결정
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0FA564), // 앱의 핵심 브랜드 색상
    brightness: Brightness.light, // 밝은 테마 (어두운 테마: Brightness.dark)
    primary: const Color(0xFF0FA564), // 주 색상
    secondary: const Color(0xFFFFD16F), // 보조 색상
  ),
   */

  // 텍스트 테마
  textTheme: const TextTheme(
    /**
     * displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),

    headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),

    titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),

    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),

    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500),
     */
  ),

  // 앱 바 테마
  appBarTheme: const AppBarTheme(),

  // 버튼 테마
  elevatedButtonTheme: ElevatedButtonThemeData(),

  // 입력 필드 테마
  inputDecorationTheme: InputDecorationTheme(),

  // 카드 테마
  cardTheme: CardThemeData(),
);
