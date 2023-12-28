import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/app_error_widget.dart';
import '/components/filter_panel.dart';
import '/components/filter_text.dart';
import '/components/user_card.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/users_info.dart';
import '/service/user_providers.dart';
import 'filter_page.dart';

class AuthorsPage extends HookConsumerWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(usersFilterProvider);
    final dataProvider = usersProvider(filter);
    final usersInfoAsync = ref.watch(dataProvider);

    Widget activityIndicator() => const CupertinoActivityIndicator().center();

    Widget listHeader(int userCount) => [
          '${context.l10n.found} ${context.l10n.authorsCount(userCount)}'
              .text3Bold,
          const Divider().padding(top: 12),
          FilterText(filter: filter).padding(top: 16),
        ].toColumnCrossStart().padding(horizontal: AppSizes.p20, bottom: 32);

    getItemBuilder(UsersInfo value) => (context, index) {
          if (index == value.data.length) {
            Future(() => ref.read(dataProvider.notifier).getNextPage());
            return activityIndicator().aspectRatio(aspectRatio: 1);
          }
          return UserCard(user: value.data[index])
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
              ['art'.ultraOutlined, 8.gap, 'artists'.ultra].toRow(),
              context.l10n.authorsPageIntro.text2Bold.padding(top: 14),
            ].toColumn().padding(vertical: 40, horizontal: AppSizes.p20),
          ),
          ...switch (usersInfoAsync) {
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
      FilterPanel(
        filter: filter,
        onFilter: (value) =>
            ref.read(usersFilterProvider.notifier).state = value,
        options: const {FilterOption.country},
      ).alignment(Alignment.bottomCenter).safeArea(),
    ].toStack();
  }
}
