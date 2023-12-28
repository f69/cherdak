import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/app_error_widget.dart';
import '/components/service_card.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/services_info.dart';
import '/service/service_providers.dart';

class ServicesPage extends HookConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(servicesFilterProvider);
    final dataProvider = servicesProvider(filter);
    final servicesInfoAsync = ref.watch(dataProvider);

    Widget activityIndicator() => const CupertinoActivityIndicator().center();

    Widget listHeader(int userCount) => [
          '${context.l10n.found} ${context.l10n.servicesCount(userCount)}'
              .text3Bold,
          const Divider().padding(top: 12, bottom: 32),
        ].toColumnCrossStart().padding(horizontal: AppSizes.p20);

    getItemBuilder(ServicesInfo value) => (context, index) {
          if (index == value.data.length) {
            Future(() => ref.read(dataProvider.notifier).getNextPage());
            return activityIndicator().aspectRatio(aspectRatio: 1);
          }
          return ServiceCard(info: value.data[index])
              .padding(bottom: 32, horizontal: AppSizes.p20);
        };

    Widget buildErrorWidget(Object? error) => SliverFillRemaining(
          child: AppErrorWidget(
            error: error,
            onRetry: () => ref.invalidate(dataProvider),
          ),
        );

    return [
      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: [
              ['art'.ultraOutlined, 8.gap, 'services'.ultra].toRow(),
              context.l10n.authorsPageIntro.text2Bold.padding(top: 14),
            ].toColumn().padding(vertical: 40, horizontal: AppSizes.p20),
          ),
          ...switch (servicesInfoAsync) {
            AsyncData(:final value) => [
                SliverToBoxAdapter(child: listHeader(value.meta.totalItems)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    getItemBuilder(value),
                    childCount: value.listItemCount,
                  ),
                ),
                SliverToBoxAdapter(child: 80.gap),
              ],
            AsyncError(:final error) => [buildErrorWidget(error)],
            _ => [SliverFillRemaining(child: activityIndicator())],
          },
        ],
      ),
      // const FilterPanel().alignment(Alignment.bottomCenter).safeArea(),
    ].toStack();
  }
}
