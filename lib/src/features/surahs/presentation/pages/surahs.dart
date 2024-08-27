import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/features/surahs/cubit/surahs_cubit.dart';
import 'package:jumma/src/features/surahs/data/model/local/surahs_model.dart';
import 'package:jumma/src/core/extensions/bracket_extension.dart';

class Surahs extends StatelessWidget {
  const Surahs({super.key, required this.surahsModel});
  final SurahsModel surahsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surahsModel.ad.sn,
            style: GoogleFonts.dmSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 25,
                color: AppColors.black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surahsModel.ad,
              style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
            ),
            BlocBuilder<SurahsCubit, SurahsState>(builder: (context, state) {
              if (state is SurahsLoading) {
                return const CircularProgressIndicator();
              } else if (state is SurahsSuccess) {
                final surahs = state.surahsData;
                return SizedBox(
                  height: context.fullHeight * 0.841,
                  child: ListView.builder(
                      itemCount: surahsModel.say,
                      itemBuilder: (_, i) {
                        if (surahsModel.id == surahs[i]['chapter']) {
                          return Text(
                            surahs[i]['text'],
                            style: GoogleFonts.dmSans(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.black),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                );
              } else {
                return const SizedBox.shrink();
              }
            })
          ],
        ),
      ),
    );
  }
}
