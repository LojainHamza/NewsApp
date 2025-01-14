import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: AppColors.whiteColor
    ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF)
  );
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: AppColors.blackColor
      ),
    scaffoldBackgroundColor: const Color(0xFF171717)
  );
}