import 'dart:collection';
import 'dart:convert';

import 'package:cherdak/components/menu/main_menu_item.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../flutter_test_config.dart';

void printJson(Object? object) {
  debugPrint(const JsonEncoder.withIndent('  ').convert(object));
}

extension AppTestExt on WidgetTester {
  Future<void> showMainMenu() async {
    final menuButton = find.byIcon(Icons.menu);
    await tap(menuButton);
    await pumpAndSettle();
  }

  Future<void> selectHomeTab(HomeTab tab) async {
    await showMainMenu();
    final menuItems = find.byType(MainMenuItem);
    await tap(menuItems.at(tab.index));
    await pumpAndSettle();
  }

  Future<void> showFilterPage() async {
    final filterButton = find.byIcon(Icons.tune);
    await tap(filterButton);
    await pumpAndSettle();
  }

  Future<void> closePage() async {
    final closeButton = find.byIcon(Icons.close);
    await tap(closeButton);
    await pumpAndSettle();
  }

  Future<void> backPage() async {
    final backButton = find.byIcon(Icons.arrow_back);
    await tap(backButton);
    await pumpAndSettle();
  }
}

extension WidgetTesterExtension on WidgetTester {
  Future<void> pageBackExt() async {
    return TestAsyncUtils.guard<void>(() async {
      Finder backButton = find.byType(BackButton);
      if (backButton.evaluate().isEmpty) {
        backButton = find.byType(CupertinoNavigationBarBackButton);
      }

      expectSync(backButton, findsOneWidget,
          reason: 'One back button expected on screen');

      await tap(backButton);
    });
  }

  Future<void> setSurfaceSize(Size size) async {
    await binding.setSurfaceSize(size);
    view.physicalSize = size;
    view.devicePixelRatio = 1.0;
  }

  Future<void> pump2([
    Duration? duration,
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
  ]) async {
    // pumpAndSettle times out with Riverpod(?)
    // https://stackoverflow.com/questions/67186472/error-pumpandsettle-timed-out-maybe-due-to-riverpod
    // https://groups.google.com/g/flutter-dev/c/F3G8FtFnenE?pli=1
    // and we need at least 2 calls to pump
    await pump();
    await pump(const Duration(seconds: 1));
  }

  Future<void> waitAndPump({
    int waitCount = 2,
    int? seconds = 1,
    Duration? duration,
  }) async {
    for (int i = 0; i < waitCount; i++) {
      await Future.delayed(duration ?? Duration(seconds: seconds ?? 1));
      await pump2();
    }
  }

  // для отображения изображений из сети, которые создаются в асихронном
  // коде (например, AsyncValue.when(...))
  // pumpWidgetBuilder и customPrimeAssets должны вызываться из
  // tester.runAsync() для устранения зависания теста
  //
  // waitAndPump с двумя повторами нужен для загрузки изображений
  Future<void> pumpWidgetGoldenAndWait({
    required Widget widget,
    WidgetWrapper? wrapper,
    Size surfaceSize = const Size(800, 600),
    double textScaleSize = 1.0,
    int waitCount = 2,
    int? seconds = 1,
    Duration? duration,
  }) async {
    await runAsync(() async {
      await pumpWidgetBuilder(
        widget,
        wrapper: wrapper,
        surfaceSize: surfaceSize,
        textScaleSize: textScaleSize,
      );
      await pump();
      await customPrimeAssets(this);
      await waitAndPump(
          waitCount: waitCount, seconds: seconds, duration: duration);
    });
  }
}

bool mapsEqual(Map<String, dynamic> map1, Map<String, dynamic> map2) {
  final sorted1 =
      SplayTreeMap<String, dynamic>.from(map1, (a, b) => a.compareTo(b));
  final sorted2 =
      SplayTreeMap<String, dynamic>.from(map2, (a, b) => a.compareTo(b));
  return sorted1.toString() == sorted2.toString();
}
