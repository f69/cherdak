import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/widget_ext.dart';
import 'app_colors.dart';
import 'filter_page.dart';

class FilterPanel extends StatelessWidget {
  const FilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    Widget item(String text, Icon icon) => [
          text.text2SemiBold.textColor(AppColors.beige),
          const Spacer(),
          icon
        ].toRow().height(60);

    void editSorting() {}

    void editFilter() {
      context.pushMaterial((context) => const FilterPage());
    }

    return [
      item(context.l10n.sorting, const Icon(Icons.keyboard_arrow_down))
          .padding(left: 20, right: 8)
          .pressable(
              onPressed: editSorting,
              pressedBackgroundColor: AppColors.inactiveGrey.withOpacity(0.5))
          .expanded(),
      const VerticalDivider(),
      item(context.l10n.filter, const Icon(Icons.tune, size: 16))
          .padding(left: 12, right: 20)
          .pressable(
              onPressed: editFilter,
              pressedBackgroundColor: AppColors.inactiveGrey.withOpacity(0.5))
          .expanded(),
    ]
        .toRow()
        .border(top: 1, bottom: 1, color: AppColors.lightGrey)
        .backgroundColor(AppColors.background)
        .iconTheme(color: AppColors.beige)
        .height(60);
  }
}
