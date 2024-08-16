import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/cards/work_card.dart';
import '/components/filter/filter_panel.dart';
import '/components/misc/data_list.dart';
import '/ext/context_ext.dart';
import '/model/works_item.dart';
import '/service/work_providers.dart';
import 'filter_page.dart';

class GalleryPage extends HookConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardSize = AppSizes.workCardSize(context);
    final filter = ref.watch(worksFilterProvider);

    return [
      DataList(
        dataProvider: worksProvider(filter),
        filterProvider: worksFilterProvider,
        titleText: 'art gallery',
        descriptionText: context.l10n.artGalleryIntro,
        countTextFunction: context.l10n.worksCount,
        cardBuilder: (WorksItem data) =>
            WorkCard(info: data).height(cardSize.height),
      ),
      FilterPanel(
        sorting: true,
        filter: filter,
        onFilter: (value) =>
            ref.read(worksFilterProvider.notifier).state = value,
        options: const {
          FilterOption.category,
          FilterOption.genre,
          FilterOption.country
        },
      ).alignment(Alignment.bottomCenter).safeArea(),
    ].toStack();
  }
}
