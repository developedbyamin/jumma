import 'package:flutter/material.dart';
import '../app_colors.dart';

class JummaOutlinedButtonTheme{
  static OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      foregroundColor: WidgetStateProperty.all(Colors.black),
      overlayColor: WidgetStateProperty.all(AppColors.primary.withOpacity(0.3)),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'DMSans'
        ),
      ),
    ),
  );
}