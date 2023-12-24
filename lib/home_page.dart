import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import 'base_app_bar.dart';
import 'category_paintings_ribbon.dart';
import 'home_header.dart';
import 'main_menu.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BaseAppBar(
        leading: Builder(builder: (context) {
          return const Icon(Icons.menu)
              .pressable(onPressed: context.scaffold.openDrawer);
        }),
        actions: const [Icon(CupertinoIcons.search, size: 18)],
      ),
      drawer: Drawer(
        backgroundColor: context.scaffoldBgColor,
        width: context.screenSize.width,
        child: const MainMenu(),
      ),
      body: [
        const HomeHeader().padding(vertical: 40),
        const CategoryPaintingsRibbon(categoryId: 1),
        const CategoryPaintingsRibbon(categoryId: 4),
        const CategoryPaintingsRibbon(categoryId: 6),
      ]
          .toColumn(separator: const SizedBox(height: 80))
          .padding(bottom: 80)
          .scrollable(),
    );
  }
}
