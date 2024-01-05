import 'package:cherdak/app.dart';
import 'package:cherdak/model/user_info.dart';
import 'package:cherdak/model/users_info.dart';
import 'package:cherdak/model/works_info.dart';
import 'package:cherdak/service/api_providers.dart';
import 'package:cherdak/service/common_providers.dart';
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

  group('', () {
    testGoldens('Main page shows promo cards', (tester) async {
      await tester.pumpWidgetBuilder(
        ProviderScope(
            overrides: [apiClientProvider.overrideWithValue(mockClient)],
            child: const App()),
      );
      await tester.pump();
      await multiScreenGolden(tester, 'main_page.promo_cards');
    });

    testGoldens('Authors page shows user cards', (tester) async {
      when(() => mockClient.getAuthors(1, any())).thenAnswer((_) async =>
          UsersInfo(
              data: [UserInfo(id: 1, slug: 'user1', name: 'User Name')],
              meta: simpleMetadata(1)));

      await tester.pumpWidgetBuilder(
        ProviderScope(overrides: [
          apiClientProvider.overrideWithValue(mockClient),
          mainMenuProvider.overrideWith((ref) => 3),
        ], child: const App()),
      );
      await tester.pump();
      await multiScreenGolden(tester, 'authors_page');
    });
  });
}
