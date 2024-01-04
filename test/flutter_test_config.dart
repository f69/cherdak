import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      enableRealShadows: true,
      primeAssets: (_) async {},
      defaultDevices: const [
        // Device.phone,
        // Device.iphone11,
        // Device.tabletPortrait
        Device(
          name: 'iphone11',
          size: Size(414, 896),
          // devicePixelRatio: 3.0,
          safeArea: EdgeInsets.only(top: 44, bottom: 34),
        )
      ],
    ),
  );
}

// copy of defaultPrimeAssets without tester.runAsync to prevent hang
Future<void> customPrimeAssets(WidgetTester tester) async {
  final imageElements = find.byType(Image, skipOffstage: false).evaluate();
  final containerElements =
      find.byType(DecoratedBox, skipOffstage: false).evaluate();

  for (final imageElement in imageElements) {
    final widget = imageElement.widget;
    if (widget is Image) {
      await precacheImage(widget.image, imageElement);
    }
  }
  for (final container in containerElements) {
    final widget = container.widget as DecoratedBox;
    final decoration = widget.decoration;
    if (decoration is BoxDecoration) {
      if (decoration.image != null) {
        await precacheImage(decoration.image!.image, container);
      }
    }
  }
}
