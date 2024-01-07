import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '/app/app_colors.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import 'main_menu_item.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key, this.scaffoldContext});
  final BuildContext? scaffoldContext;

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      context.l10n.main,
      context.l10n.gallery,
      context.l10n.services,
      context.l10n.authors,
      context.l10n.about,
    ];

    return menuItems
        .mapIndexed((index, e) => MainMenuItem(
            index: index, caption: e, scaffoldContext: scaffoldContext))
        .toList()
        .toColumnCrossStart(separator: 12.gap)
        .textStyle(style: const TextStyle(color: AppColors.inactiveGrey));
  }
}
