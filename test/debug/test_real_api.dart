import 'dart:io';

import 'package:cherdak/service/api_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../tools/utils.dart';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  // setting a custom override that'll use an unmocked HTTP client
  // because default client always return status 400 in test
  HttpOverrides.global = _MyHttpOverrides();

  late ProviderContainer container;

  setUpAll(() async {
    container = ProviderContainer(
      overrides: [apiDioProvider.overrideWithValue(Dio())],
    );
  });

  group('API', () {
    test('gives stats', () async {
      final result = await container.read(apiClientProvider).getStats();
      printJson(result);
    });
  });
}
