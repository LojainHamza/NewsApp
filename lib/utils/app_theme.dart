import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true,color: AppColors.whiteColor, iconTheme: IconThemeData(color: AppColors.blackColor)),
    indicatorColor: AppColors.blackColor,
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.medium14Black,
      headlineLarge: AppStyles.medium20Black
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true,color: AppColors.blackColor, iconTheme: IconThemeData(color: AppColors.whiteColor)),
    indicatorColor: AppColors.whiteColor,
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    textTheme: TextTheme(
        labelLarge: AppStyles.bold16White,
        labelMedium: AppStyles.medium14White,
        headlineLarge: AppStyles.medium20White
    ),
  );
}