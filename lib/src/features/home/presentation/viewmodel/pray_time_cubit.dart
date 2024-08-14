import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/home/domain/entities/pray_time.dart';
import 'package:jumma/src/features/home/domain/usecases/pray_time_use_case.dart';

import '../../../../../service_locator.dart';
part 'pray_time_state.dart';

class PrayTimeCubit extends Cubit<PrayTimeState> {
  PrayTimeCubit() : super(PrayTimeLoading());

  Future<void> getPrayTimes() async {
    final result = await sl<PrayTimeUseCase>().call();
    result.fold(
      (failure) => emit(PrayTimeFailure()),
      (prayData) => emit(
        PrayTimeSuccess(
          prayTimes: prayData,
        ),
      ),
    );
  }
}
