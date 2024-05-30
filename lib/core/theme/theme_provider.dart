import 'package:car_store_app_ui/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class ThemeProvider {
  static const String fontFamily = "Montserrat";
  static ThemeData ligth = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
          background: AppColor.scaffoldBackgroundColor, primary: Colors.white),
      fontFamily: ThemeProvider.fontFamily);
  static ThemeData dark = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
          background: AppColor.scaffoldBackgroundColor,
          primary: Colors.grey[900]!),
      brightness: Brightness.dark,
      fontFamily: ThemeProvider.fontFamily);
}
