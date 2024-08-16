import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../models/pray_time.dart';


abstract class PrayService {
  Future<Either> getPrayService();
}

class PrayServiceImpl extends PrayService {
  final Dio _dio = Dio();
  @override
  Future<Either> getPrayService() async {
    try {
      final response = await _dio.get('https://nam.az/api/v3/baki');
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
}