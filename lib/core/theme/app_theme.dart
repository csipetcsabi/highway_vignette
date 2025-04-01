import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData themeDataLight() {
    return ThemeData(
      primaryColor: AppColors.naviColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.limeColor,
        foregroundColor: AppColors.naviColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          backgroundColor: AppColors.naviColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 48),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          foregroundColor: AppColors.naviColor,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: AppColors.naviColor, width: 2),
          ),
        ),
      ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
          fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.checkBackgroundColor;
            }
            return Colors.white;
          }),
          checkColor:  WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            return AppColors.checkTickColor;
          }),
          side: BorderSide(
            color: AppColors.checkBackgroundColor,
            width: 2,
          ),
        ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Yettel'),
        bodyLarge: TextStyle(fontFamily: 'Yettel'),
        bodySmall: TextStyle(fontFamily: 'Yettel'),
        displayLarge: TextStyle(fontFamily: 'Yettel'),
        displayMedium: TextStyle(fontFamily: 'Yettel'),
        displaySmall: TextStyle(fontFamily: 'Yettel'),
        headlineLarge: TextStyle(fontFamily: 'Yettel'),
        headlineMedium: TextStyle(fontFamily: 'Yettel'),
        headlineSmall: TextStyle(fontFamily: 'Yettel'),
        labelLarge: TextStyle(fontFamily: 'Yettel'),
        labelMedium: TextStyle(fontFamily: 'Yettel'),
        labelSmall: TextStyle(fontFamily: 'Yettel'),
        titleLarge: TextStyle(fontFamily: 'Yettel'),
        titleMedium: TextStyle(fontFamily: 'Yettel'),
        titleSmall: TextStyle(fontFamily: 'Yettel'),
      ),
    );
  }

  static final headings4Style = TextStyle(
    fontFamily: 'Yettel',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: 0,
  );

  static final bodyTextStyle = TextStyle(
    fontFamily: 'Yettel',
    fontWeight: FontWeight.w300,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
  );

  static final bodyText6Style = TextStyle(
    fontFamily: 'Yettel',
    fontWeight: FontWeight.w100,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
  );

  static const headings1Style = TextStyle(
    fontFamily: 'Yettel',
    fontWeight: FontWeight.w600,
    fontSize: 40,
    height: 48 / 40,
    letterSpacing: -0.02,
  );

  static final TextStyle headings5Style = TextStyle(
  fontFamily: 'Yettel',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  height: 24 / 16,
  letterSpacing: 0,);
}
