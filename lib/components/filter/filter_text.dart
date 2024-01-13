import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/request_params.dart';
import '/service/data_providers.dart';

class FilterText extends HookConsumerWidget {
  const FilterText({
    super.key,
    this.filter = const RequestParams(),
    this.defaultCategoryId,
  });

  final RequestParams filter;
  final int? defaultCategoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryId = filter.categoryId ?? defaultCategoryId;
    final countriesList = ref.watch(countriesProvider).valueOrNull;
    final genresList = ref.watch(genresProvider(categoryId ?? 1)).valueOrNull;

    final result = <Widget>[];

    final categories = getCategories(context);
    final serviceTypes = getServiceTypes(context);

    final categoryName = categories[categoryId];
    final serviceName = serviceTypes[filter.serviceType];
    final genreName = genresList
        ?.firstWhereOrNull((e) => e.id == filter.genreId)
        ?.getTitle(context);
    final countryName = countriesList
        ?.firstWhereOrNull((e) => e.id == filter.countryId)
        ?.getTitle(context);

    void addOption(String caption, String? value) {
      if (value != null) {
        result.add([
          '$caption: '.text2.textColor(AppColors.inactiveGrey),
          value.text2,
        ].toRowMin());
      }
    }

    addOption(context.l10n.category, categoryName);
    addOption(context.l10n.genre, genreName);
    addOption(context.l10n.country, countryName);
    addOption(context.l10n.serviceType, serviceName);

    final separator = ' – '.text2.textColor(AppColors.inactiveGrey);
    return result.isEmpty
        ? const SizedBox.shrink()
        : Wrap(
            direction: Axis.horizontal,
            children: result.expand((e) => [e, separator]).toList()
              ..removeLast());
  }
}
