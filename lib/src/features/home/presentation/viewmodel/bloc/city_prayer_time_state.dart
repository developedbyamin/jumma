part of 'city_prayer_time_bloc.dart';

abstract class CityPrayerTimeState extends Equatable {
  @override
  List<Object> get props => [];
}

class CityPrayerTimeInitial extends CityPrayerTimeState {
  final String initialCity;

  CityPrayerTimeInitial({required this.initialCity});

  @override
  List<Object> get props => [initialCity];
}

class CityChanged extends CityPrayerTimeState {
  final String city;

  CityChanged({required this.city});

  @override
  List<Object> get props => [city];
}

class CityPrayerTimeLoading extends CityPrayerTimeState {}

class CityPrayerTimeSuccess extends CityPrayerTimeState {
  final List<PrayerTimeEntity> prayerTimes;

  CityPrayerTimeSuccess({required this.prayerTimes});

  @override
  List<Object> get props => [prayerTimes];
}

class CityPrayerTimeFailure extends CityPrayerTimeState {}
