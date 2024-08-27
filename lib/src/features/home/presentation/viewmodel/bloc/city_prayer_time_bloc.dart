import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jumma/src/features/home/domain/entities/pray_time.dart';
import '../../../../../../service_locator.dart';
import '../../../domain/usecases/get_prayer_time_use_case.dart';
part 'city_prayer_time_event.dart';
part 'city_prayer_time_state.dart';

class CityPrayerTimeBloc extends Bloc<CityPrayerTimeEvent, CityPrayerTimeState> {
  CityPrayerTimeBloc() : super(CityPrayerTimeInitial(initialCity: 'Bakı')) {
    on<CitySelected>(_onCitySelected);
    on<PrayerTimesRequested>(_onPrayerTimesRequested);
  }

  Future<void> _onCitySelected(CitySelected event, Emitter<CityPrayerTimeState> emit) async {
    emit(CityPrayerTimeLoading());
    emit(CityChanged(city: event.city));
    add(PrayerTimesRequested(city: event.city));
  }

  Future<void> _onPrayerTimesRequested(PrayerTimesRequested event, Emitter<CityPrayerTimeState> emit) async {
    emit(CityPrayerTimeLoading());

    try {
      final params = GetPrayerTimeParams(city: event.city, month: DateTime.now().month.toString());
      final result = await sl<GetPrayerTimeUseCase>().call(params: params);

      result.fold(
            (failure) => emit(CityPrayerTimeFailure()),
            (data) => emit(CityPrayerTimeSuccess(prayerTimes: data)),
      );
    } catch (e) {
      emit(CityPrayerTimeFailure());
    }
  }

}
