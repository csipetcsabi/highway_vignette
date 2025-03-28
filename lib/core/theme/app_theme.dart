import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static ThemeData themeDataLight(){
    return ThemeData(
      primaryColor: AppColors.naviColor,
      appBarTheme:AppBarTheme(
        backgroundColor: AppColors.limeColor,
        foregroundColor: AppColors.naviColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48),
          textStyle: TextStyle(fontSize: 16 ,fontWeight:FontWeight.w600 ),
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
          textStyle: TextStyle(fontSize: 16 ,fontWeight:FontWeight.w600 ),
          foregroundColor: AppColors.naviColor,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: AppColors.naviColor,),
          ),
        ),
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