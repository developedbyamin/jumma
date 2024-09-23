import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/theme/app_colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {super.key,
      this.labelText,
      this.validator,
      this.obscureText = false,
      this.controller,
      this.hintText,
      this.readOnly = false,
      this.keyboardType,
      this.maxLines = 1});

  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.dmSans(
            fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.grey),
        labelText: labelText,
        //contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
      ),
    );
  }
}
