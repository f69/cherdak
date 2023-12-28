import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/components/home_app_bar.dart';
import '/components/main_menu.dart';
import '/ext/context_ext.dart';
import '/service/common_providers.dart';
import 'about_page.dart';
import 'authors_page.dart';
import 'gallery_page.dart';
import 'main_page.dart';
import 'services_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuIndex = ref.watch(mainMenuProvider);

    return Scaffold(
      appBar: const HomeAppBar(),
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
        4 => const AboutPage(),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
