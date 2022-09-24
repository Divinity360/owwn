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
            headline2: headlineTwoTextStyle,
            headline3: headlineThreeTextStyle,
            headline4: headlineFourTextStyle,
            headline5: headlineFiveTextStyle,
            button: buttonTextStyle,
          ),
    );
  }

  /// Application Text styles

  static final TextStyle headlineOneTextStyle = TextStyle(
    fontSize: 31,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static final TextStyle headlineThreeTextStyle = TextStyle(
    fontFamily: 'DMSerifDisplay',
    fontSize: 15,
    color: AppColors.black,
  );
  static final TextStyle headlineFourTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headlineFiveTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headlineTwoTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 21.0,
    fontWeight: FontWeight.w400,
  );

  /// Application Button styles

  static final TextStyle buttonTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 19,
    fontWeight: FontWeight.w900,
  );

  /// Application Appbar theme

  static final AppBarTheme appBarTheme =
      AppBarTheme(backgroundColor: AppColors.black, elevation: 0);
}
