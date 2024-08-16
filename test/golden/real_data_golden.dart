import 'package:cherdak/app.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../tools/golden_tools.dart';
import '../tools/utils.dart';

void main() async {
  initGoldens();

  group('Real data tests', () {
    testGoldens('show main page', (tester) async {
      final container = ProviderContainer();

      await tester.pumpWidgetGoldenAndWait(
          widget: UncontrolledProviderScope(
              container: container, child: const App()));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      await multiScreenGolden(tester, 'real_data.home_page.main',
          autoHeight: true);

      await tester.runAsync(() async {
        container.read(homeTabProvider.notifier).state = HomeTab.gallery;
        await tester.pump();
        await tester.waitAndPump();
      });

      await multiScreenGolden(tester, 'real_data.home_page.gallery',
          overrideGoldenHeight: 3600);
    });
  });
}
