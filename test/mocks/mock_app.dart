import 'package:cherdak/app.dart';
import 'package:cherdak/service/api_providers.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mock_api.dart';

({Widget app, ProviderContainer container}) mockApp({
  ProviderContainer? container,
  HomeTab? homeTab,
  Widget? home,
  List<Override> overrides = const [],
}) {
  final mockClient = getMockApiClient();

  final providerContainer = ProviderContainer(
    overrides: [
      apiClientProvider.overrideWithValue(mockClient),
      if (homeTab != null)
        homeTabProvider.overrideWith((ref) => HomeTab.authors),
      ...overrides,
    ],
  );

  return (
    app: UncontrolledProviderScope(
      container: container ?? providerContainer,
      child: App(home: home),
    ),
    container: container ?? providerContainer,
  );
}
