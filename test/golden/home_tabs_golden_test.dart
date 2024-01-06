import 'package:cherdak/service/common_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../mocks/mock_app.dart';
import '../tools/golden_tools.dart';
import '../tools/riverpod_ext.dart';

void main() async {
  initGoldens();

  group('', () {
    testGoldens('Home page tabs', (tester) async {
      final (app, container) = mockApp();

      Future<void> showTab(HomeTab tab) async {
        container.setHomeTab(tab);
        await tester.pumpAndSettle();
        await multiScreenGolden(tester, tab.name, autoHeight: true);
      }

      await tester.pumpWidgetBuilder(app);
      await tester.pumpAndSettle();

      for (final tab in HomeTab.values) {
        await showTab(tab);
      }
    });
  });
}
