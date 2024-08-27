import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'surahs_state.dart';

class SurahsCubit extends Cubit<SurahsState> {
  SurahsCubit() : super(SurahsInitial());

   Future<void> surahs() async {
    emit(SurahsLoading());
    try {
      final String data = await rootBundle.loadString('assets/json/quran.json');
      final surahsData = await jsonDecode(data);
      final List surahsList = await surahsData["quran"];
      emit(SurahsSuccess(surahsList));
    } catch (e) {
      emit(SurahsError('Xəta baş verdi'));
    }
  }
}
