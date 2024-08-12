import 'package:flutter/material.dart';

class JummaInputDecorationTheme{

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(

    labelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'DMSans',
      color: Color(0xFF545454),
    ),
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.all(12),
    hintStyle: const TextStyle(
      color: Color(0xff383838),
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFDFDFDF), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFDFDFDF), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
  );

}