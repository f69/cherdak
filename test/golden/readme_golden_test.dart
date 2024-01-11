import 'package:cherdak/app.dart';
import 'package:cherdak/components/cards/work_card.dart';
import 'package:cherdak/components/menu/main_menu_item.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../tools/golden_tools.dart';
import '../tools/utils.dart';

void main() async {
  initGoldens();

  group('Readme golden test', () {
    testGoldens('produces screenshots for README.md', (tester) async {
      await tester.pumpWidgetGoldenAndWait(
          surfaceSize: const Size(400, 800),
          widget: ProviderScope(
              overrides: [langProvider.overrideWith((ref) => 'en')],
              child: const App()));
      await tester.pumpAndSettle();
      await tester.runAsync(() => tester.waitAndPump());

      await screenMatchesGolden(tester, 'readme/screenshot1');

      final menuIcon = find.byIcon(Icons.menu);
      await tester.tap(menuIcon);
      await tester.pumpAndSettle();

      await screenMatchesGolden(tester, 'readme/screenshot2');

      final menuItems = find.byType(MainMenuItem);
      await tester.tap(menuItems.at(1));
      await tester.runAsync(() => tester.waitAndPump());

      await screenMatchesGolden(tester, 'readme/screenshot3');

      final workCards = find.byType(WorkCard);
      await tester.tap(workCards.first);
      await tester.runAsync(() => tester.waitAndPump());

      await screenMatchesGolden(tester, 'readme/screenshot4',
          customPump: (tester) => tester.pump2());
    });
  });
}
