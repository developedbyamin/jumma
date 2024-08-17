part of 'pray_time_cubit.dart';

@immutable
sealed class PrayTimeState {}

class PrayTimeLoading extends PrayTimeState{}

class PrayTimeSuccess extends PrayTimeState{
  final PrayTimeEntity prayTimes;
  final DateTime? nextPrayerTime;
  PrayTimeSuccess({required this.prayTimes, required this.nextPrayerTime});

}

class PrayTimeFailure extends PrayTimeState{}