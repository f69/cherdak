import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_client.dart';

part 'api_providers.g.dart';

var logDio = !Platform.environment.containsKey('FLUTTER_TEST');

@Riverpod(keepAlive: true)
Dio apiDio(ApiDioRef ref) {
  final dio = Dio();

  dio.interceptors.addAll([
    if (kDebugMode && logDio)
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

@Riverpod(keepAlive: true)
ApiClient apiClient(ApiClientRef ref) {
  final apiDio = ref.watch(apiDioProvider);
  return ApiClient(apiDio);
}
