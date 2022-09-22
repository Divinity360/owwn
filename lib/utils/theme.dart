import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';

/// Application themes styles

class AppThemeData {
  AppThemeData._();

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.black,
      backgroundColor: AppColors.black,
      appBarTheme: appBarTheme,
      fontFamily: 'Roboto',
      textTheme: ThemeData.dark().textTheme.copyWith(
            headline1: headlineOneTextStyle,
            headline3: headlineThreeTextStyle,
          ),
    );
  }

  /// Application Text themes

  static final TextStyle headlineOneTextStyle =
      TextStyle(fontSize: 31, letterSpacing: 0.5, fontWeight: FontWeight.w400, color: AppColors.white);

  static final TextStyle headlineThreeTextStyle = TextStyle(
    fontFamily: 'DMSerifDisplay',
    fontSize: 15,
    color: AppColors.black,
  );

  /// Application Appbar theme

  static final AppBarTheme appBarTheme =
      AppBarTheme(backgroundColor: AppColors.black, elevation: 0);
}
