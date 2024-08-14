import 'package:dartz/dartz.dart';
import 'package:jumma/src/features/home/data/sources/pray_service.dart';
import 'package:jumma/src/features/home/domain/repository/pray_time_repository.dart';

import '../../../../../service_locator.dart';

class PrayTimeRepositoryImpl extends PrayTimeRepository{
  @override
  Future<Either> getPrayTimes() async {
    return await sl<PrayService>().getPrayService();
  }
}