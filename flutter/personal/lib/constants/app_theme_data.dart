import 'package:flutter/material.dart';
import 'package:personal/constants/app_color.dart';

class AppThemeData {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColor.primaryColor,
      surface: AppColor.backgroundColor,
      onSurface: AppColor.sectionColor,
    ),
  );
}