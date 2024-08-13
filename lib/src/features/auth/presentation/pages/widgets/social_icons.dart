import 'package:flutter/material.dart';
import '../../../../../core/assets/assets/app_vectors.dart';
import '../../../../../core/common/widgets/icon_button.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        JummaIconButton(
          onPressed: () {},
          iconPath: AppVectors.google,
        ),
        const SizedBox(
          width: 16,
        ),
        JummaIconButton(
          onPressed: () {},
          iconPath: AppVectors.facebook,
        ),
        const SizedBox(
          width: 16,
        ),
        JummaIconButton(
          onPressed: () {},
          iconPath: AppVectors.twitter,
        ),
      ],
    );
  }
}