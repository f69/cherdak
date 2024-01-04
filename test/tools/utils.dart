import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
}
