import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';


class BottomAppBarItem extends StatelessWidget {
  final String vectorPath;
  final int selectedIndex;
  final int currentIndex;
  final String labelText;
  final VoidCallback onTap;
  const BottomAppBarItem({super.key, required this.vectorPath, required this.selectedIndex, required this.currentIndex, required this.onTap, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: SvgPicture.asset(
            vectorPath,
            colorFilter: ColorFilter.mode(
              selectedIndex == currentIndex ? Colors.black : const Color(0xFF8A8A8A),
              BlendMode.srcIn,
            ),
          ),
          onPressed: onTap,
        ),
        Text(labelText, style: TextStyle(color: selectedIndex == currentIndex ? Colors.black : const Color(0xFF8A8A8A), fontWeight: selectedIndex == currentIndex ? FontWeight.bold : FontWeight.normal,),),
      ],
    );
  }
}
