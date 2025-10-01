import 'package:dodamdodam_fe/config/constants.dart';
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

  // 앱 바 테마
  appBarTheme: const AppBarTheme(),

  // 버튼 테마
  elevatedButtonTheme: ElevatedButtonThemeData(),

  // 입력 필드 테마
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceVariant,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),

    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    isDense: false,

    hintStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color(0xff6C6C6C),
    ),
  ),

  // 카드 테마
  cardTheme: CardThemeData(),
);
