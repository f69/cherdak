import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import 'app_colors.dart';

class PaintingsRibbon extends HookConsumerWidget {
  const PaintingsRibbon({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return [
      [
        context.l10n.paintingsFromCategory.h3,
        const Divider(height: 1, color: AppColors.lightGrey)
            .padding(top: 20, bottom: 32),
      ].toColumnCrossStart().padding(horizontal: 20),
    ].toColumnCrossStart();
  }
}
