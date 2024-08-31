import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/core/extensions/sizedbox_extension.dart';

import '../../../core/config/theme/app_colors.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton(
      {super.key,
      required this.text,
      required this.svg,
      this.onTap,
      this.borderColor = AppColors.borderColor,
      this.textColor = AppColors.black});

  final String text;
  final String svg;
  final void Function()? onTap;
  final Color borderColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: context.fullHeight * 0.047,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: borderColor,
              )),
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            children: [
              SvgPicture.asset(svg),
              10.w,
              Expanded(
                  child: Text(
                text,
                style: GoogleFonts.dmSans(
                    fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
              )),
              const Icon(Icons.navigate_next_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
