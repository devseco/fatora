import 'package:cashback/core/utils/app_colors.dart';
import 'package:cashback/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme:  AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        height: 1.3,
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}