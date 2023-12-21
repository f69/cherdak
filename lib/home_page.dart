import 'package:cherdak/app_colors.dart';
import 'package:cherdak/ext/app_ext.dart';
import 'package:cherdak/ext/context_ext.dart';
import 'package:cherdak/home_header.dart';
import 'package:cherdak/main_menu.dart';
import 'package:cherdak/pixel_wrapped.dart';
import 'package:styled_widget/styled_widget.dart';

import 'app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'app_app_bar.dart';

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
      body: [
        const HomeHeader(),
      ].toColumn().padding(top: 40),
    );
  }
}
