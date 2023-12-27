import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import 'app_button.dart';

class AppErrorWidget extends HookConsumerWidget {
  const AppErrorWidget({
    super.key,
    this.error,
    this.message,
    this.onRetry,
  });

  final Object? error;
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return [
      const Icon(
        CupertinoIcons.exclamationmark_triangle,
        color: AppColors.inactiveGrey,
        size: 96,
      ).padding(bottom: 24),
      Text(
        message ?? error?.toString() ?? '',
        style: AppStyles.text3,
        textAlign: TextAlign.center,
      ),
      if (onRetry != null)
        AppButton(
          onPressed: onRetry?.call,
          child: Text(context.l10n.retry),
        ).padding(top: 32),
    ]
        .toColumn(mainAxisSize: MainAxisSize.min)
        .center()
        .padding(horizontal: AppSizes.p20);
  }
}
