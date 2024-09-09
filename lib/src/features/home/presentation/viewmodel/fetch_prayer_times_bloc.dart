import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/home/domain/usecases/get_prayer_time_use_case.dart';
import '../../../../../service_locator.dart';
import '../../domain/entities/pray_time.dart';
part 'fetch_prayer_times_event.dart';
part 'fetch_prayer_times_state.dart';

class FetchPrayerTimesBloc
    extends Bloc<FetchPrayerTimesEvent, FetchPrayerTimesState> {
  FetchPrayerTimesBloc() : super(FetchPrayerTimesInitial()) {
    on<CityPrayerTimesEvent>(_onCityPrayerTimesEvent);
  }

  Future<void> _onCityPrayerTimesEvent(
      CityPrayerTimesEvent event, Emitter<FetchPrayerTimesState> emit) async {
    emit(FetchPrayerTimesLoading());

    try {
      GetPrayerTimeParams params =
          GetPrayerTimeParams(city: event.city, month: 'august');

      var result = await sl<GetPrayerTimeUseCase>().call(params: params);

      result.fold(
        (failure) => emit(
          FetchPrayerTimesFailure(error: 'Error'),
        ),
        (data) => emit(
          FetchPrayerTimesSuccess(prayerTimes: data, city: event.city),
        ),
      );
    } catch (e) {
      emit(FetchPrayerTimesFailure(error: e.toString()));
    }
  }
}
