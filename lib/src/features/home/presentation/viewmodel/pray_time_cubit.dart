import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../service_locator.dart';
import '../../domain/entities/pray_time.dart';
import '../../domain/usecases/pray_time_use_case.dart';
part 'pray_time_state.dart';

class PrayTimeCubit extends Cubit<PrayTimeState> {
  PrayTimeCubit() : super(PrayTimeLoading());

  Future<void> getPrayTimes() async {
    final result = await sl<PrayTimeUseCase>().call();
    result.fold(
          (failure) => emit(PrayTimeFailure()),
          (prayData) {
        final nextPrayerTime = sl<PrayTimeUseCase>().getNextPrayerTime(prayData);
        emit(
          PrayTimeSuccess(
            nextPrayerTime: nextPrayerTime!,
            prayTimes: prayData,
          ),
        );
      },
    );
  }

}
