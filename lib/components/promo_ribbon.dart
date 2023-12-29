import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/components/promo_card.dart';
import '/ext/context_ext.dart';
import '/service/common_providers.dart';

class PromoRibbon extends HookConsumerWidget {
  const PromoRibbon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: AppSizes.p20),
      children: [
        PromoCard(
          number: '001',
          caption: '$appTitle — ${context.l10n.onlineGallery}',
          text: context.l10n.galleryPromo,
          actionText: context.l10n.gotoGallery,
          onAction: () => ref.read(mainMenuProvider.notifier).state = 1,
        ),
        PromoCard(
          number: '002',
          caption: '${context.l10n.sellWith}\n$appTitle',
          text: context.l10n.sellPromo,
          actionText: context.l10n.doRegister,
          onAction: () {},
        ),
        const PromoCard(
          number: '003',
          caption: '',
          text: '',
        ),
        const PromoCard(
          number: '004',
          caption: '',
          text: '',
        ),
      ],
    ).height(216);
  }
}
