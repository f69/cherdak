import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';
import '/widgets/pixel_wrapped.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      PixelWrapped(
        child: [
          'Cherdak Dalí'.h1,
          'inspirational'.h1Outlined,
          'art'.h1,
        ].toRow(separator: 12.gap).padding(left: 16),
      ).padding(top: 32, bottom: 20),
      Image.asset('assets/images/banner.jpg', fit: BoxFit.cover)
          .aspectRatio(aspectRatio: 360 / 120),
      [
        Text(
          context.l10n.aboutPageIntro,
          style: AppStyles.text3,
          textAlign: TextAlign.end,
        ).padding(top: 8, bottom: 60),
        context.l10n.ideaHeader.h3
            .textColor(AppColors.inactiveGrey)
            .padding(bottom: 16),
        context.l10n.ideaText.text2SemiBold.textColor(AppColors.textLightGrey),
        Image.asset('assets/images/founders.jpg', fit: BoxFit.cover)
            .padding(top: 32, bottom: 40),
        context.l10n.implementationHeader.h3
            .textColor(AppColors.inactiveGrey)
            .padding(bottom: 16),
        context.l10n.implementationText.text2SemiBold
            .textColor(AppColors.textLightGrey),
        20.gap,
        context.l10n.implementationText2.text2Bold
            .padding(left: 12)
            .border(left: 1, color: AppColors.beige),
      ].toColumnCrossStart().padding(horizontal: AppSizes.p20, bottom: 80),
    ].toColumnCrossStart().scrollable();
  }
}
