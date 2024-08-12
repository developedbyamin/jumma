import 'package:flutter/material.dart';

import '../app_colors.dart';

class JummaTabBarTheme{

  static const TabBarTheme tabBarTheme = TabBarTheme(
    labelColor: Colors.black,
    indicatorColor: AppColors.primary,
    dividerColor: Colors.transparent,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
  );
}