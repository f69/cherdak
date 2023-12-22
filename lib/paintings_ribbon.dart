import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/works_request.dart';
import '/service/works_provider.dart';
import 'app_colors.dart';
import 'work_card.dart';

class PaintingsRibbon extends StatelessWidget {
  const PaintingsRibbon({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        worksRequestProvider
            .overrideWithValue(WorksRequest(categoryId: categoryId))
      ],
      child: const _PaintingsRibbon(),
    ).padding(bottom: 80);
  }
}

class _PaintingsRibbon extends HookConsumerWidget {
  const _PaintingsRibbon();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worksInfoAsync = ref.watch(worksProvider);

    final categoryName =
        worksInfoAsync.value?.data.firstOrNull?.category.title ?? '';
    final workCount = worksInfoAsync.value?.meta.totalItems;
    final countText =
        workCount == null ? '' : context.l10n.worksCount(workCount);
    final cardWidth = context.screenSize.width - 20 * 2;
    final cardHeight = cardWidth + 147;

    return [
      [
        context.l10n.paintingsFromCategory.h3,
        [
          categoryName.h3.padding(right: 8),
          countText.text3.textColor(AppColors.beige),
        ].toRow(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
        ),
        const Divider(height: 1, color: AppColors.lightGrey)
            .padding(top: 20, bottom: 32),
      ].toColumnCrossStart().padding(horizontal: AppSizes.p20),
      switch (worksInfoAsync) {
        AsyncData(:final value) => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20),
            scrollDirection: Axis.horizontal,
            itemCount: value.data.length,
            itemBuilder: (context, index) {
              return WorkCard(info: value.data[index])
                  .width(cardWidth)
                  .padding(right: 8);
            },
          ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const CupertinoActivityIndicator().center(),
      }
          .height(cardHeight),
    ].toColumnCrossStart();
  }
}
