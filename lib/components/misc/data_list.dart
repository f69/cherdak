import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/paged_data_info.dart';
import '/service/paged_data_notifier.dart';
import 'app_activity_indicator.dart';
import 'app_error_widget.dart';

typedef CountTextFunction = String Function(Object count);

typedef CardBuilder<T extends Object> = Widget Function(T data);

typedef DataProviderCast = AutoDisposeFamilyAsyncNotifierProvider;

class DataList<T extends PagedDataInfo, R extends Object>
    extends HookConsumerWidget {
  const DataList({
    super.key,
    required this.dataProvider,
    required this.titleText,
    required this.descriptionText,
    required this.countTextFunction,
    required this.cardBuilder,
    required this.filterTextBuilder,
  });

  final ProviderListenable<AsyncValue<T>> dataProvider;
  final String titleText;
  final String descriptionText;
  final CountTextFunction countTextFunction;
  final CardBuilder<R> cardBuilder;
  final WidgetBuilder filterTextBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<T> dataAsync = ref.watch(dataProvider);

    void refreshData() => ref.invalidate(dataProvider as DataProviderCast);

    Widget buildCaption() {
      return [
        titleText
            .split(' ')
            .mapIndexed((index, e) => index.isEven ? e.ultraOutlined : e.ultra)
            .toList()
            .toRow(separator: 8.gap),
        descriptionText.text2Bold.padding(top: 14),
      ].toColumn().padding(vertical: 40, horizontal: AppSizes.p20);
    }

    Widget buildListHeader(int itemCount) {
      return [
        '${context.l10n.found} ${countTextFunction(itemCount)}'.text3Bold,
        const Divider().padding(top: 12),
        filterTextBuilder(context).padding(top: 16),
      ].toColumnCrossStart().padding(horizontal: AppSizes.p20, bottom: 32);
    }

    NullableIndexedWidgetBuilder getItemBuilder(T value) =>
        (BuildContext context, int index) {
          Future getNextPage() async {
            final notifier = (dataProvider as DataProviderCast).notifier;
            (ref.read(notifier) as PagedDataNotifier).getNextPage();
          }

          if (index == value.data.length) {
            Future(getNextPage);
            return const AppActivityIndicator().aspectRatio(aspectRatio: 1);
          } else {
            return cardBuilder(value.data[index])
                .padding(bottom: 32, horizontal: AppSizes.p20);
          }
        };

    SliverList buildList(T value) => SliverList(
          delegate: SliverChildBuilderDelegate(
            getItemBuilder(value),
            childCount: value.listItemCount,
          ),
        );

    Widget buildErrorWidget(Object? error) =>
        AppErrorWidget(error: error, onRetry: refreshData)
            .toSliverFillRemaining();

    return CustomScrollView(
      slivers: [
        buildCaption().toSliver(),
        ...switch (dataAsync) {
          AsyncData(:final value) => [
              buildListHeader(value.meta.totalItems).toSliver(),
              buildList(value),
              80.gap.toSliver(),
            ],
          AsyncError(:final error) => [buildErrorWidget(error)],
          _ => [const AppActivityIndicator().toSliverFillRemaining()],
        },
      ],
    );
  }
}
