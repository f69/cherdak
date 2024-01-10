import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/widget_ext.dart';

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
        .pressableGrey(onPressed: onPressed)
        .height(height ?? 48)
        .textStyle(
          style: AppStyles.text3Bold.copyWith(
              color: filled ? AppColors.textBlack : AppColors.textWhite),
        );
  }
}
