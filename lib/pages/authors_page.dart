import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/components/cards/user_card.dart';
import '/components/filter/filter_panel.dart';
import '/components/misc/data_list.dart';
import '/ext/context_ext.dart';
import '/model/user_info.dart';
import '/service/user_providers.dart';
import 'filter_page.dart';

class AuthorsPage extends HookConsumerWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(usersFilterProvider);

    return [
      DataList(
        dataProvider: usersProvider(filter),
        filterProvider: usersFilterProvider,
        titleText: 'art artists',
        descriptionText: context.l10n.authorsPageIntro,
        countTextFunction: context.l10n.authorsCount,
        cardBuilder: (UserInfo data) => UserCard(user: data),
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
