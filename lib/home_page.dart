import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import 'app.dart';
import 'app_app_bar.dart';
import 'home_header.dart';
import 'main_menu.dart';
import 'paintings_ribbon.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppAppBar(
        leading: Builder(builder: (context) {
          return const Icon(Icons.menu)
              .pressable(onPressed: context.scaffold.openDrawer);
        }),
        title: const Text(appTitle),
        actions: const [Icon(CupertinoIcons.search, size: 18)],
      ),
      drawer: Drawer(
        backgroundColor: context.scaffoldBgColor,
        width: context.screenSize.width,
        child: const MainMenu(),
      ),
      body: ListView(
        children: [
          const HomeHeader().padding(vertical: 40),
          const PaintingsRibbon(categoryId: 1),
          const PaintingsRibbon(categoryId: 2),
          const PaintingsRibbon(categoryId: 3),
        ],
      ),
    );
  }
}
