import 'package:flutter/material.dart';

import '/pressable.dart';

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
