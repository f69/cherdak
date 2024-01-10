import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/app/app_colors.dart';
import '/service/common_providers.dart';
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

  Widget pressableGrey({
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    double pressedOpacity = 0.4,
    bool ripple = false,
    Color? pressedForegroundColor,
    bool isPressed = false,
  }) =>
      Pressable(
        onPressed: onPressed,
        onLongPressed: onLongPressed,
        pressedOpacity: pressedOpacity,
        ripple: ripple,
        pressedForegroundColor: pressedForegroundColor,
        pressedBackgroundColor: AppColors.inactiveGrey.withOpacity(0.5),
        isPressed: isPressed,
        child: this,
      );
}

extension AppWidgetRefExt on WidgetRef {
  void setHomeTab(HomeTab tab) => read(homeTabProvider.notifier).state = tab;
}
