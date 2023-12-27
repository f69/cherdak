import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/model/request_params.dart';
import '/service/common_providers.dart';
import '/service/user_providers.dart';
import '/service/work_providers.dart';
import 'base_app_bar.dart';

class HomeAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  static const pageIndexesWithSearch = [1, 3];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuIndex = ref.watch(mainMenuProvider);
    final hasSearch = pageIndexesWithSearch.contains(menuIndex);
    final showSearchField = useState(false);
    final searchController = useTextEditingController(keys: [menuIndex]);

    void showMenu() => context.scaffold.openDrawer();

    void switchSearch() {
      if (showSearchField.value) {
        final provider = switch (menuIndex) {
          3 => usersFilterProvider,
          _ => worksFilterProvider
        };

        ref.read(provider.notifier).update(
            (state) => state.copyWith(searchString: searchController.text));
      }
      showSearchField.value = !showSearchField.value;
    }

    void checkHideField(PointerDownEvent event) {
      if (event.position.dx < context.screenSize.width - 60 ||
          event.position.dy > context.padding.top + preferredSize.height) {
        showSearchField.value = false;
      }
    }

    return BaseAppBar(
      leading: const Icon(Icons.menu).pressable(onPressed: showMenu),
      title: showSearchField.value
          ? TextField(
              decoration: InputDecoration(hintText: context.l10n.search),
              controller: searchController,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              onTapOutside: checkHideField,
              autofocus: true,
            ).padding(right: 16)
          : null,
      actions: [
        if (hasSearch)
          const Icon(CupertinoIcons.search, size: 18)
              .width(44)
              .pressable(onPressed: switchSearch),
      ],
    );
  }

  @override
  Size get preferredSize => const BaseAppBar().preferredSize;
}
