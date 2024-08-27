import 'package:dartz/dartz.dart';
import 'package:jumma/src/features/home/data/sources/local/pray_service.dart';
import 'package:jumma/src/features/home/domain/entities/pray_time.dart';
import '../../../../../service_locator.dart';
import '../../domain/repository/prayer_time_repository.dart';

class PrayerTimeRepositoryImpl extends PrayerTimeRepository{
  @override
  Future<Either> getPrayTimes(String city, String month) async {
    return await sl<PrayerTimeService>().getPrayTimes(city,month);
  }

  @override
  Future<Either> getTodayPrayerTimes(List<PrayerTimeEntity> prayerTimeEntity, int today) {
    throw UnimplementedError();
  }
}