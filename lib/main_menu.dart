import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_colors.dart';
import '/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import 'app.dart';
import 'base_app_bar.dart';
import 'menu_close_button.dart';
import 'service/common_providers.dart';

class MainMenu extends HookConsumerWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuIndex = ref.watch(mainMenuProvider);
    final currentLang = ref.watch(langProvider);

    final menuItems = [
      context.l10n.main,
      context.l10n.gallery,
      context.l10n.services,
      context.l10n.authors,
      context.l10n.about,
      // context.l10n.blog,
    ];
    Widget langSwitch(String lang) => lang.h3
        .textColor(lang == currentLang ? AppColors.beige : null)
        .pressable(
            onPressed: () => ref.read(langProvider.notifier).state = lang);

    Widget menuItem(String caption, int index) {
      return caption.h1
          .textColor(index == menuIndex ? AppColors.textWhite : null)
          .pressable(onPressed: () {
        ref.read(mainMenuProvider.notifier).state = index;
        context.scaffold.closeDrawer();
      });
    }

    return Scaffold(
      appBar: BaseAppBar(
        title: appTitle.text2Bold.padding(left: 4),
        actions: [MenuCloseButton(onPressed: context.scaffold.closeDrawer)],
        centerTitle: false,
      ),
      body: [
        // [
        //   const Icon(
        //     CupertinoIcons.search,
        //     color: AppColors.inactiveGrey,
        //     size: 36,
        //   ).padding(right: 8),
        //   context.l10n.search.h1
        // ].toRow().pressable(onPressed: () {}),
        menuItems
            .map((e) => menuItem(e, menuItems.indexOf(e)))
            .toList()
            .toColumnCrossStart(separator: const SizedBox(height: 12))
            .textStyle(style: const TextStyle(color: AppColors.inactiveGrey))
            .padding(top: 60, left: 20),
        const Spacer(),
        [
          [langSwitch('en'), '/'.h3, langSwitch('ru')].toRowMainCenter(),
          [
            context.l10n.enter.h3.pressable(onPressed: () {}),
            '|'.h3.padding(horizontal: 4),
            context.l10n.register.h3.pressable(onPressed: () {}),
          ].toRowMainCenter().padding(top: 6),
        ].toColumn().padding(bottom: 32),
      ].toColumnCrossStart().safeArea(),
    );
  }
}
