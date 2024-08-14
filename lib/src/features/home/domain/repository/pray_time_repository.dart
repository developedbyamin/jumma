import 'package:dartz/dartz.dart';

abstract class PrayTimeRepository {
  Future<Either> getPrayTimes();
}