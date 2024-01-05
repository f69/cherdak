import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/service/common_providers.dart';

class MoreAboutButton extends HookConsumerWidget {
  const MoreAboutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return [
      context.l10n.moreAboutUs.textButton
          .textColor(AppColors.beige)
          .padding(top: 8),
      [
        const SizedBox(width: 150, height: 50)
            .border(top: 12, color: AppColors.textWhite),
        const SizedBox(width: 60, height: 60)
            .border(top: 12, right: 12, color: AppColors.textWhite)
            .alignment(Alignment.topRight)
            .rotate(angle: pi / 4, alignment: Alignment.topRight)
            .translate(offset: const Offset(8, 6)),
      ].toStack().width(150).padding(left: 56, top: 40, right: AppSizes.p20),
    ].toStack().pressable(onPressed: () => ref.setHomeTab(HomeTab.about));
  }
}
