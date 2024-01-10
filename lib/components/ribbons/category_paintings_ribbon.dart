import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import 'works_ribbon.dart';

class CategoryPaintingsRibbon extends StatelessWidget {
  const CategoryPaintingsRibbon({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return WorksRibbon(
      categoryId: categoryId,
      headerBuilder: (context, info, _) {
        final categoryName = categories[categoryId] ?? '';
        final workCount = info?.meta.totalItems;
        final countText =
            workCount == null ? '' : context.l10n.worksCount(workCount);

        return [
          context.l10n.paintingsFromCategory.h3,
          [
            categoryName.h3.padding(right: 8),
            countText.text3.textColor(AppColors.beige),
          ].toRow(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
          ),
          const Divider(height: 1, color: AppColors.lightGrey)
              .padding(top: 20, bottom: 32),
        ].toColumnCrossStart().padding(horizontal: AppSizes.p20);
      },
    );
  }
}
