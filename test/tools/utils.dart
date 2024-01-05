import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../flutter_test_config.dart';

void printJson(Object? object) {
  debugPrint(const JsonEncoder.withIndent('  ').convert(object));
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
