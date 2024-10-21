import 'package:e_learning_app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lighttheme = ThemeData(
  scaffoldBackgroundColor: AppColor.lightBackgroundColor,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color(0xff212121),
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.lightBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: AppColor.lightBackgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    titleMedium: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: AppColor.darkBackgroundColor,
    ),
    bodyLarge: const TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: AppColor.darkBackgroundColor,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey[500],
    ),
    labelMedium: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    labelLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColor.darkBackgroundColor,
    ),
  ),
);
ThemeData darktheme = ThemeData(
  scaffoldBackgroundColor: AppColor.darkBackgroundColor,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color(0xffffffff),
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.darkBackgroundColor,
      statusBarIconBrightness: Brightness.light,
    ),
    color: AppColor.darkBackgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColor.lightBackgroundColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: AppColor.lightBackgroundColor,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColor.lightBackgroundColor,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColor.lightBackgroundColor),
);
