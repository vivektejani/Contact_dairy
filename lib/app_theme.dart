import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static bool isDark = false;
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      headline2: TextStyle(
        color: Colors.red,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColor.primaryColorLight,
        secondary: AppColor.secondaryColorLight,
        brightness: Brightness.light),
  );

  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(color: AppColor.primaryColorDark),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColor.primaryColorDark,
        secondary: AppColor.secondaryColorDark,
        brightness: Brightness.dark,
      ));
}
