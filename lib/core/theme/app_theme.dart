import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static ThemeData themeDataLight(){
    return ThemeData(
      appBarTheme:AppBarTheme(
        backgroundColor: AppColors.limeColor,
        foregroundColor: AppColors.naviColor,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'ytel'),
        bodyLarge: TextStyle(fontFamily: 'ytel'),
        bodySmall: TextStyle(fontFamily: 'ytel'),
        displayLarge: TextStyle(fontFamily: 'ytel'),
        displayMedium: TextStyle(fontFamily: 'ytel'),
        displaySmall: TextStyle(fontFamily: 'ytel'),
        headlineLarge: TextStyle(fontFamily: 'ytel'),
        headlineMedium: TextStyle(fontFamily: 'ytel'),
        headlineSmall: TextStyle(fontFamily: 'ytel'),
        labelLarge: TextStyle(fontFamily: 'ytel'),
        labelMedium: TextStyle(fontFamily: 'ytel'),
        labelSmall: TextStyle(fontFamily: 'ytel'),
        titleLarge: TextStyle(fontFamily: 'ytel'),
        titleMedium: TextStyle(fontFamily: 'ytel'),
        titleSmall: TextStyle(fontFamily: 'ytel'),
      ),

    );
  }

}