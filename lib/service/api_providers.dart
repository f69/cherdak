import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_client.dart';

part 'api_providers.g.dart';

@riverpod
Dio apiDio(ApiDioRef ref) {
  final dio = Dio();
  dio.interceptors.addAll([
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ),
  ]);

  return dio;
}

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final apiDio = ref.watch(apiDioProvider);
  return ApiClient(apiDio);
}
