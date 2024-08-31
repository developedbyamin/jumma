import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';

import '../../../core/assets/assets/app_vectors.dart';
import '../../../core/config/theme/app_colors.dart';

class NameAndEmail extends StatelessWidget {

  const NameAndEmail({ super.key });

   @override
   Widget build(BuildContext context) {
       return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: context.fullHeight * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.borderColor
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Ruslan Salmanov',style: GoogleFonts.dmSans(fontSize: 18,fontWeight: FontWeight.w700,color: AppColors.black),),
                    Row(
                      children: [
                        Expanded(child: Text('ruslan1234@gmail.com',style: GoogleFonts.dmSans(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.black))),
                        SvgPicture.asset(AppVectors.change),
                      ],
                    )
                  ],
                ),
              );
  }
}