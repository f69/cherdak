import 'package:cherdak/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../flutter_test_config.dart';
import '../tools/golden_tools.dart';
import '../tools/utils.dart';

void main() async {
  initGoldens();

  group('Real data tests', () {
    testGoldens('show main page', (tester) async {
      // для отображения изображений из сети, которые создаются в асихронном
      // коде (например, AsyncValue.when(...))
      // pumpWidgetBuilder и customPrimeAssets должны вызываться из
      // tester.runAsync() для устранения зависания теста
      await tester.runAsync(() async {
        await tester.pumpWidgetBuilder(const ProviderScope(child: App()));
        await tester.pump();
        await customPrimeAssets(tester);
        await Future.delayed(const Duration(seconds: 1));
        await tester.pump2();
        await Future.delayed(const Duration(seconds: 1));
        await tester.pump2();
      });
      await tester.pumpAndSettle();

      await multiScreenGolden(
        tester, 'real_data.main_page',
        // внутренний pumpAndSettle вылетает по тайм-ауту
        // customPump: (tester) => tester.pump2(),
        devices: [Device(name: 'stripe', size: Size(375, 2500))],
      );
    });
  });
}
