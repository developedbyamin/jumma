import 'package:flutter/material.dart';

import '../app_colors.dart';

class JummaElevatedButtonTheme{
  static ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'DMSans'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}