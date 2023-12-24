import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import 'app_colors.dart';
import 'paintings_ribbon.dart';

class UserWorksRibbon extends StatelessWidget {
  const UserWorksRibbon({
    super.key,
    required this.userId,
    this.excludeWorkSlug,
  });

  final int userId;
  final String? excludeWorkSlug;

  @override
  Widget build(BuildContext context) {
    return WorksRibbon(
      userId: userId,
      headerBuilder: (context, info, _) {
        final workCount = info?.meta.totalItems;
        final countText = workCount == null ? '' : '$workCount';

        return [
          context.l10n.authorOtherWorks.h3.padding(right: 8),
          countText.text3.textColor(AppColors.beige),
        ].toRowBaseline().padding(bottom: 32).padding(horizontal: AppSizes.p20);
      },
    );
  }
}
