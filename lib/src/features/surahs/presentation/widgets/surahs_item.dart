import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/features/surahs/cubit/surahs_cubit.dart';
import 'package:jumma/src/features/surahs/data/model/local/surahs_model.dart';
import 'package:jumma/src/core/extensions/navigation_extension.dart';
import 'package:jumma/src/features/surahs/presentation/pages/surahs.dart';

class SurahsItem extends StatelessWidget {
  const SurahsItem({super.key, required this.surahsModel});
  final SurahsModel surahsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.to(BlocProvider(
          create: (context) => SurahsCubit()..surahs(),
          child: Surahs(
            surahsModel: surahsModel,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: context.fullHeight * 0.09,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: AppColors.borderColor))),
        child: Row(
          children: [
            Expanded(
                child: Text(
              surahsModel.ad,
              style: GoogleFonts.dmSans(
                  color: AppColors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            )),
            SvgPicture.asset(AppVectors.next),
          ],
        ),
      ),
    );
  }
}
