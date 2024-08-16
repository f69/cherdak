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
import '/model/services_info.dart';
import '/model/users_info.dart';
import '/model/works_info.dart';
import '/service/paged_data_notifier.dart';
import '../cards/service_card.dart';
import '../cards/user_card.dart';
import '../cards/work_card.dart';
import '../filter/filter_text.dart';
import 'app_activity_indicator.dart';
import 'app_error_widget.dart';

typedef CountTextFunction = String Function(Object count);

typedef CardBuilder<T extends Object> = Widget Function(T data);

class DataList<T extends PagedDataInfo, R extends Object>
    extends HookConsumerWidget {
  const DataList({
    super.key,
    required this.dataProvider,
    required this.filterProvider,
    required this.titleText,
    required this.descriptionText,
    required this.countTextFunction,
    required this.cardBuilder,
  });

  final ProviderListenable<AsyncValue<T>> dataProvider;
  final ProviderListenable filterProvider;
  final String titleText;
  final String descriptionText;
  final CountTextFunction countTextFunction;
  final CardBuilder<R> cardBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);
    final AsyncValue<T> dataAsync = ref.watch(dataProvider);
    final cardSize = AppSizes.workCardSize(context);

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
        FilterText(filter: filter, defaultCategoryId: T == WorksInfo ? 1 : null)
            .padding(top: 16),
      ].toColumnCrossStart().padding(horizontal: AppSizes.p20, bottom: 32);
    }

    NullableIndexedWidgetBuilder getItemBuilder(T value) =>
        (BuildContext context, int index) {
          Future getNextPage() async {
            final notifier =
                (dataProvider as AutoDisposeFamilyAsyncNotifierProvider)
                    .notifier;
            (ref.read(notifier) as PagedDataNotifier).getNextPage();
          }

          Widget buildCard() {
            return switch (T) {
              const (UsersInfo) => UserCard(user: value.data[index]),
              const (ServicesInfo) => ServiceCard(info: value.data[index]),
              const (WorksInfo) =>
                WorkCard(info: value.data[index]).height(cardSize.height),
              _ => const SizedBox.shrink(),
            };
          }

          if (index == value.data.length) {
            Future(getNextPage);
            return const AppActivityIndicator().aspectRatio(aspectRatio: 1);
          }
          // return buildCard().padding(bottom: 32, horizontal: AppSizes.p20);
          return cardBuilder(value.data[index])
              .padding(bottom: 32, horizontal: AppSizes.p20);
        };

    SliverList buildList(T value) => SliverList(
          delegate: SliverChildBuilderDelegate(
            getItemBuilder(value),
            childCount: value.listItemCount,
          ),
        );

    Widget buildErrorWidget(Object? error) => AppErrorWidget(
          error: error,
          onRetry: () => ref.invalidate(
              dataProvider as AutoDisposeFamilyAsyncNotifierProvider),
        ).toSliverFillRemaining();

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
