import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/app/app_const.dart';
import '/ext/context_ext.dart';
import '/model/request_params.dart';
import '/pages/filter_value_page.dart';
import '/service/common_providers.dart';
import 'filter_item.dart';

class CategoryFilterItem extends HookConsumerWidget {
  const CategoryFilterItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(internalFilterProvider);

    void selectCategory() async {
      final selectedValue = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.category,
          values: categories.values.toList(),
          selectedValue: categories[filter.categoryId ?? 1]));

      if (selectedValue != null) {
        final selectedCategoryId = categories.entries
            .firstWhereOrNull((e) => e.value == selectedValue)
            ?.key;

        ref.watch(internalFilterProvider.notifier).update(
                (state) => state.copyWith(categoryId: selectedCategoryId ?? 1));
      }
    }

    return FilterItem(
        text: context.l10n.category,
        value: categories[filter.categoryId ?? 1],
        onPressed: selectCategory);
  }
}

