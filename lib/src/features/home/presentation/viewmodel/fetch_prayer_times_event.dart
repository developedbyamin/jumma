part of 'fetch_prayer_times_bloc.dart';

@immutable
sealed class FetchPrayerTimesEvent {}

class CityPrayerTimesEvent extends FetchPrayerTimesEvent {
  final String city;

  CityPrayerTimesEvent({required this.city});
}