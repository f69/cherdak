import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/service/common_providers.dart';
import 'base_app_bar.dart';
import 'main_menu.dart';
import 'main_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuIndex = ref.watch(mainMenuProvider);

    return Scaffold(
      appBar: BaseAppBar(
        leading: Builder(
            builder: (context) => const Icon(Icons.menu)
                .pressable(onPressed: context.scaffold.openDrawer)),
        actions: [
          const Icon(CupertinoIcons.search, size: 18)
              .pressable(onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        backgroundColor: context.scaffoldBgColor,
        width: context.screenSize.width,
        child: const MainMenu(),
      ),
      body: switch (menuIndex) {
        0 => const MainPage(),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
