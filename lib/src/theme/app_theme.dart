import 'package:credit_card_wallet/src/theme/theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark();
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      onPrimary: AppColors.appLightBackground,
      primary: AppColors.primaryColor,
      primaryContainer: AppColors.appLightBackground,
      secondary: AppColors.secondaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: AppColors.appLightBackground,
    ),
    scaffoldBackgroundColor: AppColors.appLightBackground,
  );
}
