import 'package:flutter/material.dart';
import 'package:jumma/src/core/config/theme/appTheme/elevated_button_theme.dart';
import 'package:jumma/src/core/config/theme/appTheme/outlined_button_theme.dart';
import 'package:jumma/src/core/config/theme/appTheme/slider_theme.dart';
import 'package:jumma/src/core/config/theme/appTheme/tab_bar_theme.dart';
import 'package:jumma/src/core/config/theme/appTheme/text_button_theme.dart';
import 'package:jumma/src/core/config/theme/appTheme/text_theme.dart';
import '../app_colors.dart';
import 'input_decoration_theme.dart';

class AppTheme {
  static final themeJumma = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      elevation: 0,
    ),
    brightness: Brightness.light,
    fontFamily: 'DMSans',
    sliderTheme: JummaSliderTheme.sliderThemeData,
    textButtonTheme: JummaTextButtonTheme.textButtonThemeData,
    tabBarTheme: JummaTabBarTheme.tabBarTheme,
    inputDecorationTheme: JummaInputDecorationTheme.inputDecorationTheme,
    elevatedButtonTheme: JummaElevatedButtonTheme.elevatedButtonThemeData,
    outlinedButtonTheme: JummaOutlinedButtonTheme.outlinedButtonThemeData,
    textTheme: JummaTextTheme.textTheme,
  );
}
