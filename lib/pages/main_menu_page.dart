import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/components/base_app_bar.dart';
import '/components/main_menu.dart';
import '/components/menu_close_button.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import '/service/common_providers.dart';

class MainMenuPage extends HookConsumerWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(langProvider);

    Widget langSwitch(String lang) => lang.h3
        .textColor(lang == currentLang ? AppColors.beige : null)
        .pressable(
            onPressed: () => ref.read(langProvider.notifier).state = lang);

    final closeButton = MenuCloseButton(onPressed: context.scaffold.closeDrawer)
        .padding(right: 12);

    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: false,
        title: appTitle.text2Bold.padding(left: 4),
        actions: [closeButton],
      ),
      body: [
        MainMenu(scaffoldContext: context).padding(top: 60, left: 20),
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
