import 'package:flutter/material.dart';

class JummaElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const JummaElevatedButton({super.key, required this.onPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
