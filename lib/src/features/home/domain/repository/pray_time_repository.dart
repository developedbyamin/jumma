import 'package:dartz/dartz.dart';
import '../entities/pray_time.dart';

abstract class PrayTimeRepository {
  Future<Either> getPrayTimes();
  Future<void> savePrayTimes(PrayTimeEntity prayTimes);
  Future<PrayTimeEntity?> loadPrayTimesFromLocal();
  Future<void> clearCache();
  Future<DateTime?> getNextPrayerTime(PrayTimeEntity prayTimes);
}