import 'package:dartz/dartz.dart';
import '../models/pray_time.dart';


abstract class PrayService {
  Future<Either> getPrayService();
}

class PrayServiceImpl extends PrayService {
  @override
  Future<Either> getPrayService() async {
    try {
      final prayTimeModel = PrayTimeModel.fromJson({
        'Fajr': "04:09",
        'Dhuhr': "12:46",
        'Asr': "16:36",
        'Maghrib': "19:39",
        'Isha': "21:15"
      });
      return Right(prayTimeModel.toEntity());
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}