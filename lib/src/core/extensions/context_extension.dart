import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get fullHeight => MediaQuery.of(this).size.height;
  double get fullWidth => MediaQuery.of(this).size.width;
  double get height80 => MediaQuery.of(this).size.height * 0.8;

  double get keyboardHeight => MediaQuery.viewInsetsOf(this).bottom;
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;
}