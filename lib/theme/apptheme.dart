import 'package:flutter/material.dart';

class AppTheme {
  static const _fontFamily = 'Roboto';

  static const twentyEight = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    height: 48 / 28,
    color: black,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static const twentyFour = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    height: 32 / 24,
    color: black,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static const twenty = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    height: 32 / 20,
    color: black,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static const eighteen = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    height: 28 / 18,
    color: black,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static const sixteen = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 24 / 16,
    color: black,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  static const fourteen = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 20 / 14,
    color: black,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
  static const twelve = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 16 / 12,
    color: nickel,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  ///Primary colors
  static const darkOrange = Color.fromRGBO(248, 109, 54, 1);
  static const orange = Color.fromRGBO(245, 173, 144, 1);
  static const lightOrange = Color.fromRGBO(255, 231, 222, 1);

  ///Accent colors
  static const blue = Color.fromRGBO(54, 193, 248, 1);
  static const cyan = Color.fromRGBO(205, 241, 255, 1);

  ///Neutral colors
  static const black = Color(0xff000000);
  static const gunMetal = Color.fromRGBO(43, 46, 60, 1);
  static const nickel = Color(0xff6D727A);
  static const ashGray = Color(0xffB4B7BE);
  static const silver = Color(0xffACB1B6);
  static const brightGray = Color(0xffEDECEC);
  static const cultured = Color(0xffF6F6F7);
  static const white = Color(0xffffffff);
  static const lime = Color(0xffD6FDE0);

  ///Semantic colors
  static const pink = Color(0xffFF5572);
  static const green = Color(0xff12A537);
  static const red = Color(0xffFA1E1E);

  ///Other colors
  static const yellow = Color(0xffFFC107);

  ///Shadows
  static BoxShadow lowerCardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.12),
    blurRadius: 18,
    offset: const Offset(0, 2),
  );

  static BoxShadow accentShadow = const BoxShadow(
    color: blue,
    blurRadius: 24,
    offset: Offset(0, 2),
  );

  static BoxShadow primaryShadow = BoxShadow(
    color: darkOrange.withOpacity(0.75),
    blurRadius: 24,
    offset: const Offset(0, 2),
  );

  static ThemeData appTheme() => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: white,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: darkOrange),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: silver,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: fourteen.copyWith(
            color: silver,
            height: 1,
          ),
          isDense: true,
          border: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      );
}
