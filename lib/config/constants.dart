import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final backend_url = dotenv.get('BACKEND_URL');

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xffFFCC00);
  static const Color secondary = Color(0xffffffff);
  static const Color tertiary = Color(0xffffffff);

  // Neutral Colors
  static const Color background = Color(0xffEEEDE9);
  static const Color surface = Color(0xffffffff);
  static const Color surfaceVariant = Color(0xffEEEDE9);

  // "On" Colors (콘텐츠 색상)
  static const Color onPrimary = Color(0xffffffff);
  static const Color onSecondary = Color(0xffffffff);
  static const Color onBackground = Color(0xff6C6C6C);
  static const Color onSurface = Color(0xff000000);

  // System Colors
  static const Color error = Color(0xffffffff);
  static const Color onError = Color(0xffffffff);
}
