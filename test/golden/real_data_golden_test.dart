import 'package:cherdak/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../tools/golden_tools.dart';
import '../tools/utils.dart';

void main() async {
  initGoldens();

  group('Real data tests', () {
    testGoldens('show main page', (tester) async {
      await tester.pumpWidgetGoldenAndWait(
          widget: const ProviderScope(child: App()));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      await multiScreenGolden(tester, 'real_data.main_page', autoHeight: true);
    });
  });
}
