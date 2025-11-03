import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final backend_url = dotenv.get('BACKEND_URL');

class AppColors {
  // Main Colors
  static const Color primary = Color(0xffFFCC00);
  static const Color secondary = Color(0xffffffff);
  static const Color tertiary = Color(0xffffffff);

  // BackGround Colors
  static const Color background = Color(0xffEEEDE9);
  static const Color onBoardingBackground = Color(0xffFFFFFF);
  static const Color surface = Color(0xffFBFBFB);
  static const Color onBoardingSurface = Color(0xffE7E7E7);
  static const Color surfaceVariant = Color(0xffEEEDE9);

  static const Color action = Color(0xffA9A28A);

  static const Color wrongAnswer = Color(0xffEFDAD8);
  static const Color correctAnswer = Color(0xffC6DEC3);
  static const Color correctAnswerBorder = Color(0xff8EC38E);
}

class AppTextStyle {
  static final Header header = Header();
  static final Body body = Body();
  static final Hint hint = Hint();
  static final OnPrimary onPrimary = OnPrimary();
  static final OnAction onAction = OnAction();
}

class Header {
  final TextStyle large = TextStyle(
    color: Color(0xFF000000),
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );

  final TextStyle medium = TextStyle(
    color: Color(0xFF000000),
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  final TextStyle mediumBold = TextStyle(
    color: Color(0xFF000000),
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  final TextStyle small = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
}

class Body {
  final TextStyle large = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  final TextStyle largeBold = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  final TextStyle medium = TextStyle(
    color: Color(0xFF000000),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  final TextStyle mediumBoldUnderLine = TextStyle(
    color: Color(0xFF000000),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  final TextStyle small = TextStyle(
    color: Color(0xFF000000),
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );

  final TextStyle extraSmall = TextStyle(
    color: Color(0xFF000000),
    fontSize: 9.75,
    fontWeight: FontWeight.w400,
  );

  final TextStyle extraSmallGray = TextStyle(
    color: Color(0xFF989898),
    fontSize: 9.75,
    fontWeight: FontWeight.w400,
  );
}

class Hint {
  final TextStyle large = TextStyle(
    color: Color(0xFF6C6C6C),
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  final TextStyle medium = TextStyle(
    color: Color(0xFF6C6C6C),
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  final TextStyle small = TextStyle(
    color: Color(0xFF6C6C6C),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
}

class OnPrimary {
  final TextStyle extraLarge = TextStyle(
    color: Color(0xFF000000),
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  final TextStyle large = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  final TextStyle medium = TextStyle(
    color: Color(0xFF000000),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  final TextStyle small = TextStyle(
    color: Color(0xFF000000),
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

class OnAction {
  final TextStyle extraLarge = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  final TextStyle large = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  final TextStyle medium = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  final TextStyle small = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}





/**
 * class header{}
  static const TextStyle headerLarge = TextStyle(
    color: Color(0xFF000000),
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle headerMedium = TextStyle(
    color: Color(0xFF000000),
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyMediumSemiBold = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodySmall = TextStyle(
    color: Color(0xFF000000),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle hintLarge = TextStyle(
    color: Color(0xFF6C6C6C),
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle hintMedium = TextStyle(
    color: Color(0xFF6C6C6C),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle hintSmall = TextStyle(
    color: Color(0xFF6C6C6C),
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
 */