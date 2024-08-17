import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/home/domain/usecases/get_next_prayer_time.dart';
import 'package:jumma/src/features/home/domain/usecases/load_pray_time.dart';
import 'package:jumma/src/features/home/domain/usecases/save_pray_time.dart';
import '../../../../../service_locator.dart';
import '../../domain/entities/pray_time.dart';
import '../../domain/usecases/pray_time_use_case.dart';
part 'pray_time_state.dart';

class PrayTimeCubit extends Cubit<PrayTimeState> {
  PrayTimeCubit() : super(PrayTimeLoading());

  Future<void> getPrayTimes() async {
    final localData = await sl<LoadPrayTimeUseCase>().call();

    if (localData != null) {
      final nextPrayerTime =
          await sl<GetNextPrayerTimeUseCase>().call(params: localData);
      emit(PrayTimeSuccess(
          prayTimes: localData, nextPrayerTime: nextPrayerTime));
    } else {
      final result = await sl<PrayTimeUseCase>().call();
      result.fold(
        (failure) => emit(PrayTimeFailure()),
        (prayData) async {
          final nextPrayerTime =
              await sl<GetNextPrayerTimeUseCase>().call(params: prayData);
          await sl<SavePrayTimesUseCase>().call(params: prayData);
          emit(
            PrayTimeSuccess(
              prayTimes: prayData,
              nextPrayerTime: nextPrayerTime,
            ),
          );
        },
      );
    }
  }
}
