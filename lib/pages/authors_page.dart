import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/user_card.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/users_info.dart';
import '/service/user_providers.dart';

class AuthorsPage extends HookConsumerWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(usersFilterProvider);
    final dataProvider = usersProvider(filter: filter);
    final usersInfoAsync = ref.watch(dataProvider);

    // final cardWidth = context.screenSize.width - 20 * 2;
    // final cardHeight = cardWidth + 147;

    Widget activityIndicator() => const CupertinoActivityIndicator().center();

    Widget listHeader(int totalWorks) => [
          '${context.l10n.found} ${context.l10n.worksCount(totalWorks)}'
              .text3Bold,
          const Divider().padding(top: 12, bottom: 32),
        ].toColumnCrossStart().padding(horizontal: AppSizes.p20);

    itemBuilder(UsersInfo value) => (context, index) {
          if (index == value.data.length) {
            Future(() => ref.read(dataProvider.notifier).getNextPage());
            return activityIndicator().center().aspectRatio(aspectRatio: 1);
          }
          return UserCard(user: value.data[index])
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
          ...switch (usersInfoAsync) {
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
      // const FilterPanel().alignment(Alignment.bottomCenter).safeArea(),
    ].toStack();
  }
}
