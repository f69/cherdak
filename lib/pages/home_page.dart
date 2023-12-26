import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/components/base_app_bar.dart';
import '/components/main_menu.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/pages/authors_page.dart';
import '/pages/gallery_page.dart';
import '/pages/services_page.dart';
import '/service/common_providers.dart';
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
        1 => const GalleryPage(),
        2 => const ServicesPage(),
        3 => const AuthorsPage(),
        _ => const SizedBox.shrink(),
      },
    );
  }
}