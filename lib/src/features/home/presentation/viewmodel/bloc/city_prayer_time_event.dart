part of 'city_prayer_time_bloc.dart';

abstract class CityPrayerTimeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CitySelected extends CityPrayerTimeEvent {
  final String city;

  CitySelected({required this.city});

  @override
  List<Object> get props => [city];
}

class PrayerTimesRequested extends CityPrayerTimeEvent {

  final String city;

  PrayerTimesRequested({required this.city});

  @override
  List<Object> get props => [city];
}
