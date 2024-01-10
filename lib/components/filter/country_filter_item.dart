import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/ext/context_ext.dart';
import '/model/request_params.dart';
import '/pages/filter_value_page.dart';
import '/service/common_providers.dart';
import '/service/data_providers.dart';
import 'filter_item.dart';

class CountryFilterItem extends HookConsumerWidget {
  const CountryFilterItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(internalFilterProvider);
    final countriesList = ref.watch(countriesProvider).valueOrNull;

    String? getCountryName() =>
        countriesList?.firstWhereOrNull((e) => e.id == filter.countryId)?.title;

    void selectCountry() async {
      final selectedName = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.country,
          values: [
            context.l10n.all,
            ...(countriesList?.map((e) => e.title) ?? [])
          ],
          selectedValue: filter.countryId == null
              ? context.l10n.all
              : countriesList
                  ?.firstWhereOrNull((e) => e.id == filter.countryId)
                  ?.title));

      if (selectedName != null) {
        final selectedCountry =
            countriesList?.firstWhereOrNull((e) => e.title == selectedName);

        ref.watch(internalFilterProvider.notifier).update((state) =>
            state.copyWith(
                countryId: selectedCountry?.id,
                countrySlug: selectedCountry?.slug));
      }
    }

    return FilterItem(
        text: context.l10n.country,
        value: getCountryName(),
        onPressed: selectCountry);
  }
}
