import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';

final Dio clientDio = Dio(
  BaseOptions(
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYwNzI5NThhLThmZjItNGMyMC1hMzQzLTZhYjM1ZDM3ZGUyYyIsImp0aSI6IjI4YjJhNjVmLTc1ZjEtNDEzZi1iOGVhLTFjMjlmNmIyNjE3MyIsImVtYWlsIjoiZXNleWZ1bGxheWV2NTFAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiU3VwZXJBZG1pbiIsImV4cCI6MTcyNTg3MTk0OCwiaXNzIjoiaHR0cHM6Ly9qdW1tYS5zdmRldi5tZSIsImF1ZCI6Imh0dHBzOi8vanVtbWEuc3ZkZXYubWUifQ.8c5saiJfnhVTuY3aqN59mc66PasPewTqtMIQNJbmiHM',
    },
  ),
)..interceptors.add(AwesomeDioInterceptor());
