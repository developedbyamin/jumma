part of 'fetch_prayer_times_bloc.dart';

@immutable
sealed class FetchPrayerTimesState {}

final class FetchPrayerTimesInitial extends FetchPrayerTimesState {}

final class FetchPrayerTimesLoading extends FetchPrayerTimesState {}

final class FetchPrayerTimesSuccess extends FetchPrayerTimesState {
  final List<PrayerTimeEntity> prayerTimes;
  final String city;

  FetchPrayerTimesSuccess({required this.prayerTimes, required this.city});
}

final class FetchPrayerTimesFailure extends FetchPrayerTimesState {
  final String error;

  FetchPrayerTimesFailure({required this.error});
}