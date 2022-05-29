
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.black),
      backgroundColor: AppColors.appBarColor,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppTextStyles.black17SemiBold.copyWith(fontSize: 17.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // maximumSize: Size(345, 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 140,
          vertical: 15,
        ),
        elevation: 0,
        // splashFactory: InteractiveInkFeature()
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.filColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // constraints: BoxConstraints(
      //   maxHeight: 50,
      //   minHeight: 49,
      // ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
    ),
    textTheme: TextTheme(
      headline1: AppTextStyles.kRobotoReg40ColorBlack600,
      headline2:
          AppTextStyles.kRobotoReg40ColorBlack600.copyWith(fontWeight: FontWeight.w600),
      headline6: AppTextStyles.black16Medium,
    ),
  );
}
