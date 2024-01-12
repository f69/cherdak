import 'package:flutter/material.dart';

import '/app/app_colors.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/service/common_providers.dart';
import 'main_menu_item.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key, this.scaffoldContext});
  final BuildContext? scaffoldContext;

  @override
  Widget build(BuildContext context) {
    final menuItems = {
      HomeTab.main: context.l10n.main,
      HomeTab.gallery: context.l10n.gallery,
      HomeTab.services: context.l10n.services,
      HomeTab.authors: context.l10n.authors,
      HomeTab.about: context.l10n.about,
    };

    return menuItems.entries
        .map((e) => MainMenuItem(
              itemTab: e.key,
              caption: e.value,
              scaffoldContext: scaffoldContext,
            ))
        .toList()
        .toColumnCrossStart(separator: 12.gap)
        .textStyle(color: AppColors.inactiveGrey);
  }
}
