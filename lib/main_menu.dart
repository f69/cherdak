import 'package:flutter/cupertino.dart';
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
import 'app_app_bar.dart';
import 'menu_close_button.dart';
import 'service/common_providers.dart';

class MainMenu extends HookConsumerWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(langProvider);

    Widget langSwitch(String lang) => lang.h3
        .textColor(lang == currentLang ? AppColors.beige : null)
        .pressable(
            onPressed: () => ref.read(langProvider.notifier).state = lang);

    return Scaffold(
      appBar: AppAppBar(
        title: appTitle.text2Bold.padding(left: 4),
        actions: [MenuCloseButton(onPressed: context.scaffold.closeDrawer)],
        centerTitle: false,
      ),
      body: [
        [
          context.l10n.gallery.h1
              .textColor(AppColors.textWhite)
              .pressable(onPressed: () {}),
          context.l10n.services.h1.pressable(onPressed: () {}),
          context.l10n.authors.h1.pressable(onPressed: () {}),
          context.l10n.about.h1.pressable(onPressed: () {}),
          context.l10n.blog.h1.pressable(onPressed: () {}),
          [
            const Icon(
              CupertinoIcons.search,
              color: AppColors.inactiveGrey,
              size: 36,
            ).padding(right: 8),
            context.l10n.search.h1
          ].toRow().pressable(onPressed: () {}),
        ]
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
