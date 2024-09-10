
import 'package:dartz/dartz.dart';
import 'package:jumma/src/core/usecase/usecase.dart';
import 'package:jumma/src/features/mosque/domain/repository/mosque_repository.dart';

import '../../../../../service_locator.dart';

class MosqueUsecase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<MosqueRepository>().mosque();
  }
  
}