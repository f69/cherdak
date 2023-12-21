import 'dart:math';

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import 'app_colors.dart';

class MenuCloseButton extends StatelessWidget {
  const MenuCloseButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return [
      const SizedBox(height: 5),
      context.l10n.close
          .toUpperCase()
          .text2Bold
          .padding(left: 2, vertical: 4)
          .border(bottom: 1, color: AppColors.lightGrey),
      [
        const SizedBox(width: 5, height: 5)
            .border(left: 1, top: 1, color: AppColors.lightGrey)
            .rotate(angle: -pi / 4, alignment: Alignment.topLeft)
            .translate(offset: const Offset(0, -0.5)),
      ].toStack()
    ]
        .toColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .pressable(onPressed: onPressed ?? context.scaffold.closeDrawer)
        .center();
  }
}
