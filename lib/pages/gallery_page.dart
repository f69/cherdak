import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/cards/work_card.dart';
import '/components/misc/app_error_widget.dart';
import '/components/misc/filter_panel.dart';
import '/components/misc/filter_text.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/works_info.dart';
import '/service/work_providers.dart';
import 'filter_page.dart';

class GalleryPage extends HookConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(worksFilterProvider);
    final dataProvider = worksProvider(filter);
    final worksInfoAsync = ref.watch(dataProvider);

    final cardSize = AppSizes.workCardSize(context);

    Widget activityIndicator() => const CupertinoActivityIndicator().center();

    Widget listHeader(int totalWorks) => [
          '${context.l10n.found} ${context.l10n.worksCount(totalWorks)}'
              .text3Bold,
          const Divider().padding(top: 12),
          FilterText(filter: filter, defaultCategoryId: 1).padding(top: 16),
        ].toColumnCrossStart().padding(horizontal: AppSizes.p20, bottom: 32);

    itemBuilder(WorksInfo value) => (context, index) {
          if (index == value.data.length) {
            Future(() => ref.read(dataProvider.notifier).getNextPage());
            return activityIndicator().height(cardSize.height / 2);
          }
          return WorkCard(info: value.data[index])
              .height(cardSize.height)
              .padding(bottom: 32, horizontal: AppSizes.p20);
        };

    return [
      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: [
              ['art'.ultraOutlined, 8.gap, 'gallery'.ultra].toRow(),
              context.l10n.artGalleryIntro.text2Bold.padding(top: 14),
            ].toColumn().padding(vertical: 40, horizontal: AppSizes.p20),
          ),
          ...switch (worksInfoAsync) {
            AsyncData(:final value) => [
                SliverToBoxAdapter(child: listHeader(value.meta.totalItems)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    itemBuilder(value),
                    childCount: value.listItemCount,
                  ),
                ),
                SliverToBoxAdapter(child: 80.gap),
              ],
            AsyncError(:final error) => [
                SliverFillRemaining(
                  child: AppErrorWidget(
                      error: error,
                      onRetry: () => ref.invalidate(dataProvider)),
                )
              ],
            _ => [SliverFillRemaining(child: activityIndicator())],
          },
        ],
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
