import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/pray_time.dart';
import '../models/pray_time.dart';


abstract class PrayService {
  Future<Either> getPrayService();
  Future<void> savePrayTimes(PrayTimeEntity prayTimes);
  Future<PrayTimeEntity?> loadPrayTimesFromLocal();
  DateTime? getNextPrayerTime(PrayTimeEntity prayTimes);
  Future<void> clearCache();
}

class PrayServiceImpl extends PrayService {
  final Dio _dio = Dio();



  @override
  Future<Either> getPrayService() async {
    try {
      final response = await _dio.get('https://nam.az/api/v3/baki');
      print("REQEUST GONDERILDI");
      if (response.statusCode == 200) {
        final prayTimeModel = PrayTimeModel.fromJson(response.data);
        return Right(prayTimeModel.toEntity());
      } else {
        return Left('Failed to fetch prayer times. Status code: ${response.statusCode}');
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }

  @override
  Future<void> savePrayTimes(PrayTimeEntity prayTimes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('fajr', prayTimes.fajr);
    prefs.setString('dhuhr', prayTimes.dhuhr);
    prefs.setString('asr', prayTimes.asr);
    prefs.setString('maghrib', prayTimes.maghrib);
    prefs.setString('isha', prayTimes.isha);
  }

  @override
  Future<PrayTimeEntity?> loadPrayTimesFromLocal() async  {
    final prefs = await SharedPreferences.getInstance();
    final fajr = prefs.getString('fajr');
    final dhuhr = prefs.getString('dhuhr');
    final asr = prefs.getString('asr');
    final maghrib = prefs.getString('maghrib');
    final isha = prefs.getString('isha');

    if (fajr != null && dhuhr != null && asr != null && maghrib != null && isha != null) {
      return PrayTimeEntity(
        fajr: fajr,
        dhuhr: dhuhr,
        asr: asr,
        maghrib: maghrib,
        isha: isha,
      );
    }
    return null;
  }

  @override
  DateTime? getNextPrayerTime(PrayTimeEntity prayTimes) {
    return PrayerTimeCalculator.getNextPrayerTime(DateTime.now(), prayTimes);
  }

  @override
  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('fajr');
    await prefs.remove('dhuhr');
    await prefs.remove('asr');
    await prefs.remove('maghrib');
    await prefs.remove('isha');
  }
}