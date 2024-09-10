import 'package:dartz/dartz.dart';
import 'package:jumma/service_locator.dart';
import 'package:jumma/src/features/mosque/data/sources/mosque_service.dart';
import 'package:jumma/src/features/mosque/domain/repository/mosque_repository.dart';

class MosqueRepositoryImpl extends MosqueRepository {
  @override
  Future<Either> mosque() async {
    return await sl<MosqueService>().getMosque();
  }
}
