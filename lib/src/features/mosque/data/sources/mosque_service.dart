import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jumma/src/features/mosque/data/models/mosque_model.dart';
import '../../../../core/interceptors/app_interceptor.dart';
import '../../domain/entities/mosque_entity.dart';

abstract class MosqueService {
  Future<Either<Exception, List<MosqueEntity>>> getMosque();
}

class MosqueServiceImpl extends MosqueService {
  final Dio _dio;

  MosqueServiceImpl() : _dio = Dio() {
    _dio.interceptors.add(AppInterceptor());
  }

  @override
  Future<Either<Exception, List<MosqueEntity>>> getMosque() async {
    log("Fetching mosques...");
    try {
      const url = 'https://jumma.svdev.me/api/Mosque';
      final response = await _dio.get(url);
      log("Response status code: ${response.statusCode}");
      log("Response data: ${response.data}");

      if (response.statusCode == 200) {
        // Extract 'mosques' list from the response data
        if (response.data is Map<String, dynamic>) {
          final data = response.data as Map<String, dynamic>;
          if (data.containsKey('mosques') && data['mosques'] is List) {
            List<MosqueModel> mosques = (data['mosques'] as List).map((json) {
              try {
                return MosqueModel.fromJson(json);
              } catch (e) {
                log("Error parsing JSON to MosqueModel: $e");
                throw Exception('Invalid data format');
              }
            }).toList();

            List<MosqueEntity> mosqueEntities =
                mosques.map((model) => model.toEntity()).toList();

            return Right(mosqueEntities);
          } else {
            return Left(Exception(
                'Unexpected response format: Missing or invalid "mosques" key'));
          }
        } else {
          return Left(
              Exception('Unexpected response format: Expected a JSON object'));
        }
      } else {
        return Left(Exception(
            'Failed to fetch mosques: Status code ${response.statusCode}'));
      }
    } catch (e) {
      log("Error fetching mosques: $e");
      return Left(Exception('Exception: $e'));
    }
  }
}
