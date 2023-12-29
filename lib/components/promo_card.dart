import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/widget_list_ext.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
    required this.number,
    required this.caption,
    required this.text,
    this.actionText,
    this.onAction,
  });

  final String number;
  final String caption;
  final String text;
  final String? actionText;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return [
      Image.asset('assets/images/banner.jpg', fit: BoxFit.cover),
      Styled.widget().backgroundColor(Colors.black.withOpacity(0.8)),
      [
        number.text3Bold.textColor(AppColors.textLightGrey),
        caption.h3.padding(top: 12, bottom: 10).expanded(),
        text.text2SemiBold.textColor(AppColors.textLightGrey),
        if (actionText?.isNotEmpty ?? false)
          [
            actionText!.textButton.padding(right: 4),
            const Icon(Icons.arrow_forward,
                size: 14, color: AppColors.textWhite)
          ].toRow().padding(vertical: 18).pressable(onPressed: onAction),
      ]
          .toColumnCrossStart()
          .padding(top: 12, horizontal: 8)
          .border(all: 1, color: AppColors.lightGrey),
    ].toStack(fit: StackFit.expand).width(264).padding(right: 16);
  }
}
