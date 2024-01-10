import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/request_params.dart';
import '/pages/filter_page.dart';

class FilterPanel extends HookConsumerWidget {
  const FilterPanel({
    super.key,
    this.sorting = false,
    this.filter,
    this.onFilter,
    this.options = const {},
  });

  final bool sorting;
  final RequestParams? filter;
  final ValueChanged<RequestParams>? onFilter;
  final Set<FilterOption> options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget item(String text, Icon icon) => [
          text.text2SemiBold.textColor(AppColors.beige),
          if (sorting) const Spacer(),
          icon.padding(left: 4),
        ].toRowMainCenter().height(60);

    void editSorting() {}

    void editFilter() async {
      ref.read(internalFilterProvider.notifier).state =
          filter ?? const RequestParams();
      final newFilter = await context.pushMaterial((context) => FilterPage(
            initialFilter: filter,
            options: options,
          ));

      if (newFilter != null) {
        onFilter?.call(newFilter);
      }
    }

    return [
      if (sorting) ...[
        item(context.l10n.sorting, const Icon(Icons.keyboard_arrow_down))
            .padding(left: 20, right: 8)
            .pressable(
                onPressed: editSorting,
                pressedBackgroundColor: AppColors.inactiveGrey.withOpacity(0.5))
            .expanded(),
        const VerticalDivider(),
      ],
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
