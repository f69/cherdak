import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/service/common_providers.dart';
import 'base_app_bar.dart';
import 'menu_close_button.dart';

class MainMenu extends HookConsumerWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTab = ref.watch(homeTabProvider);
    final currentLang = ref.watch(langProvider);

    final menuItems = [
      context.l10n.main,
      context.l10n.gallery,
      context.l10n.services,
      context.l10n.authors,
      context.l10n.about,
    ];

    Widget langSwitch(String lang) => lang.h3
        .textColor(lang == currentLang ? AppColors.beige : null)
        .pressable(
            onPressed: () => ref.read(langProvider.notifier).state = lang);

    Widget menuItem(String caption, int index) {
      return caption.h1
          .textColor(index == homeTab.index ? AppColors.textWhite : null)
          .pressable(onPressed: () {
        ref.setHomeTab(HomeTab.values[index]);
        context.scaffold.closeDrawer();
      });
    }

    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: false,
        title: appTitle.text2Bold.padding(left: 4),
        actions: [
          MenuCloseButton(onPressed: context.scaffold.closeDrawer)
              .padding(right: 12)
        ],
      ),
      body: [
        menuItems
            .map((e) => menuItem(e, menuItems.indexOf(e)))
            .toList()
            .toColumnCrossStart(separator: 12.gap)
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
