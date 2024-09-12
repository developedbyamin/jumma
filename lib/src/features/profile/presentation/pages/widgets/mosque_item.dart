import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/core/extensions/sizedbox_extension.dart';

import '../../../../mosque/domain/entities/mosque_entity.dart';

class MosqueItem extends StatelessWidget {
  const MosqueItem({Key? key, required this.mosques, required this.onTap, required this.color}) : super(key: key);

  final MosqueEntity mosques;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23, bottom: 10),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: context.fullWidth,
            height: context.fullHeight * .05,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                mosques.name,
                style: GoogleFonts.dmSans(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          10.h,
          const Divider(
            color: AppColors.greyLight,
            height: 1,
          )
        ]),
      ),
    );
  }
}
