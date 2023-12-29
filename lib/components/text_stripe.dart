import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';

class TextStripe extends StatelessWidget {
  const TextStripe({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return List.filled(6, text.text3Bold)
        .toRowMainCenter(separator: 12.gap)
        .padding(vertical: 5)
        .border(top: 1, bottom: 1, color: AppColors.beige)
        .backgroundColor(AppColors.background)
        .overflow(minWidth: context.screenSize.width + 300)
        .height(24);
  }
}
