import 'package:flutter/material.dart';

class JummaOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const JummaOutlinedButton({super.key, required this.onPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
