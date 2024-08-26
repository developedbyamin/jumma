import 'package:jumma/src/core/usecase/usecase.dart';
import 'package:jumma/src/features/home/domain/entities/pray_time.dart';
import 'package:jumma/src/features/home/domain/repository/pray_time_repository.dart';

import '../../../../../service_locator.dart';

class SavePrayTimesUseCase extends UseCase<void, PrayTimeEntity> {
  @override
  Future<void> call({params}) async {
    return await sl<PrayTimeRepository>().savePrayTimes(params!);
  }
}