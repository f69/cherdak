import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/components/home_app_bar.dart';
import '/ext/context_ext.dart';
import '/service/common_providers.dart';
import 'about_page.dart';
import 'authors_page.dart';
import 'gallery_page.dart';
import 'main_menu_page.dart';
import 'main_page.dart';
import 'services_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(homeTabProvider);

    return Scaffold(
      appBar: const HomeAppBar(),
      drawer: Drawer(
        backgroundColor: context.scaffoldBgColor,
        width: context.screenSize.width,
        child: const MainMenuPage(),
      ),
      body: switch (tab) {
        HomeTab.main => const MainPage(),
        HomeTab.gallery => const GalleryPage(),
        HomeTab.services => const ServicesPage(),
        HomeTab.authors => const AuthorsPage(),
        HomeTab.about => const AboutPage(),
      },
    );
  }
}
