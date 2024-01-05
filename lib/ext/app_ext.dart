import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/widgets/pressable.dart';

extension AppWidgetExt on Widget {
  Widget pressable({
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    double pressedOpacity = 0.4,
    bool ripple = false,
    Color? pressedForegroundColor,
    Color? pressedBackgroundColor,
    bool isPressed = false,
  }) =>
      Pressable(
        onPressed: onPressed,
        onLongPressed: onLongPressed,
        pressedOpacity: pressedOpacity,
        ripple: ripple,
        pressedForegroundColor: pressedForegroundColor,
        pressedBackgroundColor: pressedBackgroundColor,
        isPressed: isPressed,
        child: this,
      );
}

extension AppWidgetRefExt on WidgetRef {
  void setHomeTab(HomeTab tab) => read(homeTabProvider.notifier).state = tab;
}
