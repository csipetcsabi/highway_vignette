
import 'package:flutter/material.dart';

class AppColors {

  static Color limeColor = Color(0xFFb4ff00);
  static Color naviColor = Color(0xFF002340);
  static Color lightGrayColor = Color(0xFFF2F4F5);


  static Color lightBackgroundColor = Colors.white;
  static Color darkBackgroundColor = Colors.grey;





  static Color lightTextColor = Colors.black;
  static Color darkTextColor = Colors.white;

  static Color getAppBarColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? limeColor
        : limeColor;
  }

  static Color getBackgroundColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? lightGrayColor
        : lightGrayColor;
  }

  static Color getTextColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? darkTextColor
        : lightTextColor;
  }
}