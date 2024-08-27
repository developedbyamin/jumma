import 'package:flutter/material.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import 'package:jumma/src/features/surahs/data/model/local/surahs_model.dart';
import 'package:jumma/src/features/surahs/presentation/widgets/surahs_item.dart';

class SurahsView extends StatelessWidget {

  const SurahsView({ super.key });

   @override
   Widget build(BuildContext context) {
    const surahs = SurahsModel.surahsModelList;
       return SizedBox(
        width: context.fullWidth,
        child: ListView.builder(
          itemCount: surahs.length,
          itemBuilder: (_,i){
            return SurahsItem(surahsModel: surahs[i]);
          }),
      );
  }
}