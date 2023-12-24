import 'package:cherdak/app_styles.dart';
import 'package:cherdak/ext/app_ext.dart';
import 'package:cherdak/ext/widget_ext.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    this.onPressed,
    this.filled = false,
    this.height,
  });
  final Widget child;
  final VoidCallback? onPressed;
  final bool filled;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return child
        .center()
        .decorated(
            border: filled ? null : Border.all(color: AppColors.lightGrey),
            color: filled ? AppColors.lightGrey : null)
        .pressable(onPressed: onPressed)
        .height(height ?? 48)
        .textStyle(
          style: AppStyles.text3Bold.copyWith(
              color: filled ? AppColors.textBlack : AppColors.textWhite),
        );
  }
}
