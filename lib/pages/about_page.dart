import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';
import '/widgets/pixel_wrapped.dart';

const bannerUrl =
    'https://s3-alpha-sig.figma.com/img/af1e/ac28/f21e7213a0fe2fec53d01f5c60ed3b48?'
    'Expires=1704672000&Signature=kszXp-RJoLEcqyLHGMLCTktlE0iCpa9zz4p74XHChdh~r~'
    'K-~ili23rX9CbCAXr-PMLQaZNnNfY4bixXGrulxqzP8GHyoJqQ7ORP8og~uJOEHWn6k5kNMil~'
    'qOZsS8b-O-D8yeHqQ2ySh2xcBPeUvbkZSgT0UrnOn~8YmKFNIino0YnwHh3ThFdAVKD9VWUn5O'
    'NNMos0AA0p2J3Pj406gbdwgGLqcqrsFYCUia439hNY87~r3kti9HBuRVZWc0eQe4rDoSENxyED'
    'AyVdn3vcGBP-XxYhfh8uvF-lR4SLGLl2A5ZFz1ovoRA5RmLEqmv6ejywBYpO~38EAG4CU6oFZQ'
    '__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';

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
      CachedNetworkImage(
        imageUrl: bannerUrl,
        fit: BoxFit.cover,
      ).aspectRatio(aspectRatio: 360 / 120),
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
      ].toColumnCrossStart().padding(horizontal: AppSizes.p20),
    ].toColumnCrossStart().scrollable();
  }
}
