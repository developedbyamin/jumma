import 'package:dartz/dartz.dart';
import 'package:jumma/src/features/home/data/sources/pray_service.dart';
import 'package:jumma/src/features/home/domain/entities/pray_time.dart';
import 'package:jumma/src/features/home/domain/repository/pray_time_repository.dart';

import '../../../../../service_locator.dart';

class PrayTimeRepositoryImpl extends PrayTimeRepository{
  @override
  Future<Either> getPrayTimes() async {
    return await sl<PrayService>().getPrayService();
  }

  @override
  Future<PrayTimeEntity?> loadPrayTimesFromLocal() async {
    return await sl<PrayService>().loadPrayTimesFromLocal();
  }

  @override
  Future<void> savePrayTimes(PrayTimeEntity prayTimes) async {
    return await sl<PrayService>().savePrayTimes(prayTimes);
  }

  @override
  Future<void> clearCache() async {
    return await sl<PrayService>().clearCache();
  }

  @override
  Future<DateTime?> getNextPrayerTime(PrayTimeEntity prayTimes) async {
    return sl<PrayService>().getNextPrayerTime(prayTimes);
  }

}