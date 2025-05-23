import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';

class AppStyles{
  /// -------------------- White --------------------
  static TextStyle bold20White = GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColors.whiteColor
  );
  static TextStyle bold16White = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.whiteColor
  );
  static TextStyle medium24White = GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: AppColors.whiteColor
  );
  static TextStyle medium20White = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.whiteColor
  );
  static TextStyle medium14White = GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColors.whiteColor
  );
  /// -------------------- Grey --------------------
  static TextStyle medium12LightGrey = GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: AppColors.greyColor
  );
  /// -------------------- Black --------------------
  static TextStyle bold24Black = GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColors.blackColor
  );
  static TextStyle bold16Black = GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColors.blackColor
  );
  static TextStyle medium24Black = GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: AppColors.blackColor
  );
  static TextStyle medium20Black = GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: AppColors.blackColor
  );
  static TextStyle medium14Black = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.blackColor
  );
}