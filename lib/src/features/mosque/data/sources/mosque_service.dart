import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:jumma/src/core/network/dio/dio_client.dart';
import 'package:jumma/src/features/mosque/data/models/mosque_model.dart';

abstract class MosqueService {
  Future<Either> getMosque();
}

class MosqueServiceImpl extends MosqueService {
  @override
  Future<Either> getMosque() async {
    log('message');
    try {
      const url = 'https://jumma.svdev.me/api/Mosque';
      final response = await clientDio.get(url);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final List data = response.data;
        log(data.toString());
        return Right(
        data.map((e) => MosqueModel.fromJson(e)).toList()
        );
      }
      throw Exception('Failed to fetch mosques');
    } catch (e) {
      throw Exception(e);
    }
  }
}
