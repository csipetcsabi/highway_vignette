import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static ThemeData themeDataLight(){
    return ThemeData(
      appBarTheme:AppBarTheme(
        backgroundColor: AppColors.limeColor,
        foregroundColor: AppColors.naviColor,
      ),

    );
  }

}