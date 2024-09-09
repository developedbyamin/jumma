import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/extensions/context_extension.dart';

class AlertButton extends StatelessWidget {
  const AlertButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.textColor,
      this.borderColor = Colors.transparent, 
      required this.onTap})
      : super(key: key);

  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.fullWidth,
        height: 43,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: borderColor)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
                fontSize: 14, fontWeight: FontWeight.w700, color: textColor),
          ),
        ),
      ),
    );
  }
}
