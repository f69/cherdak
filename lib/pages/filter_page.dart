import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/components/buttons/app_button.dart';
import '/components/filter/category_filter_item.dart';
import '/components/filter/country_filter_item.dart';
import '/components/filter/genre_filter_item.dart';
import '/components/filter/service_filter_item.dart';
import '/components/misc/base_app_bar.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/service/common_providers.dart';

enum FilterOption { category, genre, country, serviceType }

class FilterPage extends HookConsumerWidget {
  const FilterPage({super.key, this.options = const {}});
  final Set<FilterOption> options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(internalFilterProvider);

    bool optIn(FilterOption option) => options.contains(option);

    Widget closeButton() => const Icon(Icons.close)
        .padding(right: 8)
        .pressable(onPressed: context.pop);

    return Scaffold(
      appBar: BaseAppBar(
        title: context.l10n.filter.text2Bold.padding(left: 4),
        centerTitle: false,
        actions: [closeButton()],
      ),
      body: [
        [
          if (optIn(FilterOption.category)) const CategoryFilterItem(),
          if (optIn(FilterOption.genre)) const GenreFilterItem(),
          if (optIn(FilterOption.country)) const CountryFilterItem(),
          if (optIn(FilterOption.serviceType)) const ServiceFilterItem(),
        ].toColumn(separator: 28.gap),
        const Spacer(),
        AppButton(
          height: 56,
          onPressed: () => context.pop(filter),
          child: context.l10n.search.toUpperCase().text2Bold,
        ),
      ]
          .toColumn()
          .padding(horizontal: AppSizes.p20, top: 40, bottom: 8)
          .safeArea(top: false),
    );
  }
}
