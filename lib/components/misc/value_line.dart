import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';

class ValueLine extends StatelessWidget {
  const ValueLine(this.caption, this.value,
      {super.key, this.bottomPadding = 12});
  final String caption;
  final String? value;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return [
      caption.text2.textColor(AppColors.inactiveGrey).padding(right: 4),
      if (value != null) value!.text2SemiBold,
    ].toRow().padding(bottom: bottomPadding);
  }
}
