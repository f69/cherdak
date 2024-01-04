import 'package:cherdak/app.dart';
import 'package:cherdak/model/works_info.dart';
import 'package:cherdak/service/api_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../complex/smoke_test.dart';
import '../fixtures/common_data.dart';
import '../fixtures/mocks.dart';
import '../tools/golden_tools.dart';

void main() async {
  late MockApiClient mockClient;

  initGoldens();

  setUpAll(() {
    registerFallbackValue(FakeRequestParams());
    mockClient = MockApiClient();
    when(() => mockClient.getWorks(1, any()))
        .thenAnswer((_) async => WorksInfo(data: [], meta: emptyMetadata));
  });

  group('Home page golden tests', () {
    testGoldens('show promo cards', (tester) async {
      await tester.pumpWidgetBuilder(
        ProviderScope(
            overrides: [apiClientProvider.overrideWithValue(mockClient)],
            child: const App()),
      );
      await tester.pump();

      await multiScreenGolden(tester, 'main_page.promo_cards');
    });
  });
}
