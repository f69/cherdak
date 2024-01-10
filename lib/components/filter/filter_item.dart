import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.text,
    this.value,
    required this.onPressed,
  });

  final String text;
  final String? value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return [
      text.text1SemiBold,
      const Spacer(),
      (value ?? context.l10n.all).text1.textColor(AppColors.textLightGrey),
      8.gap,
      const Icon(Icons.arrow_forward_ios, color: AppColors.beige)
    ]
        .toRow()
        .padding(bottom: 8)
        .border(bottom: 1, color: AppColors.grey)
        .pressable(onPressed: onPressed);
  }
}
