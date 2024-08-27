import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:jumma/src/features/home/data/models/pray_time.dart';

abstract class PrayerTimeService {
  Future<Either> getPrayTimes(String city, String month);
}

class PrayerTimeServiceImpl extends PrayerTimeService {
  @override
  Future<Either> getPrayTimes(String city, String month) async {
    try {
      final jsonString = await rootBundle.loadString(
          'lib/src/features/home/data/sources/local/prayer_times/$city/$month.json');

      final jsonData = json.decode(jsonString);
      final data = jsonData['PrayerTimes'] as List<dynamic>;

      print(data);

      final prayTimes = data
          .map((item) => PrayerTimeModel.fromJson(item))
          .map((model) => model.toEntity())
          .toList();

      return Right(prayTimes);
    } catch (e) {
      return Left(e);
    }
  }
}
