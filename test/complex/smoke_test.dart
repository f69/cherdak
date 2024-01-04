import 'package:cherdak/app.dart';
import 'package:cherdak/components/home_header.dart';
import 'package:cherdak/components/promo_ribbon.dart';
import 'package:cherdak/model/request_params.dart';
import 'package:cherdak/model/works_info.dart';
import 'package:cherdak/pages/main_page.dart';
import 'package:cherdak/service/api_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures/common_data.dart';
import '../fixtures/mocks.dart';
import '../tools/utils.dart';

class FakeRequestParams extends Fake implements RequestParams {}

void main() {
  late MockApiClient mockClient;

  setUpAll(() {
    registerFallbackValue(FakeRequestParams());
    mockClient = MockApiClient();
    when(() => mockClient.getWorks(1, any()))
        .thenAnswer((_) async => WorksInfo(data: [], meta: emptyMetadata));
  });

  group('Smoke test displays', () {
    testWidgets('main page', (tester) async {
      await tester.setSurfaceSize(const Size(800, 800));
      await tester.pumpWidget(
        ProviderScope(
            overrides: [apiClientProvider.overrideWithValue(mockClient)],
            child: const App()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MainPage), findsOneWidget);
      expect(find.byType(HomeHeader), findsOneWidget);
      expect(find.byType(PromoRibbon), findsOneWidget);
    });
  });
}
