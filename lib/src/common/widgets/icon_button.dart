import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JummaIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  const JummaIconButton({super.key, required this.onPressed, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 28,
        width: 28,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(width: 0.1),
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
