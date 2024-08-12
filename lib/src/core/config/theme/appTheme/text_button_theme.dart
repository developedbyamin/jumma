import 'package:flutter/material.dart';

class JummaTextButtonTheme{

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          return Colors.black;
        },
      ),
    ),
  );


}