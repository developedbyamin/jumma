import 'package:flutter/material.dart';

class JummaTextTheme {

  static TextTheme textTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.black,  fontFamily: 'DMSans'),
    headlineMedium: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: 'DMSans'),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),

    titleLarge: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w400, color: const Color(0xFF808080), fontFamily: 'DMSans'),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: const Color(0xFF545454), fontFamily: 'DMSans'),
    bodySmall: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w400, color: const Color(0xFF545454), fontFamily: 'DMSans'),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
  );
}