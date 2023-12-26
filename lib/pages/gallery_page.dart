import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/filter_panel.dart';
import '/components/work_card.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/works_info.dart';
import '/service/works_provider.dart';

class GalleryPage extends HookConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final request = ref.watch(worksFilterProvider);
    final dataProvider = worksProvider(request: request);
    final worksInfoAsync = ref.watch(dataProvider);

    final cardWidth = context.screenSize.width - 20 * 2;
    final cardHeight = cardWidth + 147;

    Widget activityIndicator() => const CupertinoActivityIndicator().center();

    Widget listHeader(int totalWorks) => [
          '${context.l10n.found} ${context.l10n.worksCount(totalWorks)}'
              .text3Bold,
          const Divider().padding(top: 12, bottom: 32),
        ].toColumnCrossStart().padding(horizontal: AppSizes.p20);

    itemBuilder(WorksInfo value) => (context, index) {
          if (index == value.data.length) {
            Future(() => ref.read(dataProvider.notifier).getNextPage());
            return activityIndicator().height(cardHeight / 2);
          }
          return WorkCard(info: value.data[index])
              .height(cardHeight)
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
                SliverFillRemaining(child: Text('Error: $error').center())
              ],
            _ => [SliverFillRemaining(child: activityIndicator())],
          },
        ],
      ),
      const FilterPanel().alignment(Alignment.bottomCenter).safeArea(),
    ].toStack();
  }
}
