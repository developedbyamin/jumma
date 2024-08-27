import 'package:dartz/dartz.dart';

import '../entities/pray_time.dart';
abstract class PrayerTimeRepository{
  Future<Either> getPrayTimes(String city, String month);
  Future<Either> getTodayPrayerTimes(List<PrayerTimeEntity> prayerTimeEntity, int today);
}

