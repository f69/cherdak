import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/components/app_button.dart';
import '/components/base_app_bar.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/model/request_params.dart';
import '/service/data_providers.dart';
import 'filter_value_page.dart';

enum FilterOption { category, genre, country, serviceType }

class FilterPage extends HookConsumerWidget {
  const FilterPage({
    super.key,
    this.initialFilter,
    this.options = const {},
  });

  final RequestParams? initialFilter;
  final Set<FilterOption> options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = useState(initialFilter ?? const RequestParams());
    final countriesList = ref.watch(countriesProvider).valueOrNull;
    final genresList =
        ref.watch(genresProvider(filter.value.categoryId ?? 1)).valueOrNull;

    String? categoryName() => categories[filter.value.categoryId ?? 1];

    String? genreName() => genresList
        ?.firstWhereOrNull((e) => e.id == filter.value.genreId)
        ?.title;

    String? countryName() => countriesList
        ?.firstWhereOrNull((e) => e.id == filter.value.countryId)
        ?.title;

    String? serviceName() => serviceTypes[filter.value.serviceType];

    int getCategoryIdByName(String name) {
      for (final entry in categories.entries) {
        if (entry.value == name) return entry.key;
      }
      return 1;
    }

    String? getServiceTypeByName(String name) {
      for (final entry in serviceTypes.entries) {
        if (entry.value == name) return entry.key;
      }
      return null;
    }

    void selectCategory() async {
      final selectedName = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.category,
          values: categories.values.toList(),
          selectedValue: categories[filter.value.categoryId ?? 1]));

      if (selectedName != null) {
        filter.value = RequestParams(
          categoryId: getCategoryIdByName(selectedName),
          countryId: filter.value.countryId,
        );
      }
    }

    void selectGenre() async {
      final selectedName = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.genre,
          values: [
            context.l10n.all,
            ...(genresList?.map((e) => e.title) ?? [])
          ],
          selectedValue: filter.value.genreId == null
              ? context.l10n.all
              : genresList
                  ?.firstWhereOrNull((e) => e.id == filter.value.genreId)
                  ?.title));

      if (selectedName != null) {
        filter.value = RequestParams(
          categoryId: filter.value.categoryId,
          genreId:
              genresList?.firstWhereOrNull((e) => e.title == selectedName)?.id,
          countryId: filter.value.countryId,
        );
      }
    }

    void selectCountry() async {
      final selectedName = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.country,
          values: [
            context.l10n.all,
            ...(countriesList?.map((e) => e.title) ?? [])
          ],
          selectedValue: filter.value.countryId == null
              ? context.l10n.all
              : countriesList
                  ?.firstWhereOrNull((e) => e.id == filter.value.countryId)
                  ?.title));

      if (selectedName != null) {
        final selectedCountry =
            countriesList?.firstWhereOrNull((e) => e.title == selectedName);

        filter.value = filter.value.copyWith(
          countryId: selectedCountry?.id,
          countrySlug: selectedCountry?.slug,
        );
      }
    }

    void selectService() async {
      final selectedName = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.serviceType,
          values: [
            context.l10n.all,
            ...serviceTypes.values,
          ],
          selectedValue: serviceTypes[filter.value.serviceType]));

      if (selectedName != null) {
        filter.value = filter.value
            .copyWith(serviceType: getServiceTypeByName(selectedName));
      }
    }

    Widget filterItem(
      FilterOption option,
      String text,
      String? value,
      VoidCallback onPressed,
    ) {
      if (!options.contains(option)) {
        return const SizedBox.shrink();
      }

      return [
        text.text1SemiBold,
        const Spacer(),
        (value ?? context.l10n.all).text1.textColor(AppColors.textLightGrey),
        8.gap,
        const Icon(Icons.arrow_forward_ios, color: AppColors.beige)
      ]
          .toRow()
          .padding(bottom: 8)
          .border(bottom: 1, color: AppColors.grey)
          .pressable(onPressed: onPressed)
          .padding(bottom: 28);
    }

    return Scaffold(
      appBar: BaseAppBar(
        title: context.l10n.filter.text2Bold.padding(left: 4),
        centerTitle: false,
        actions: [
          const Icon(Icons.close)
              .padding(right: 8)
              .pressable(onPressed: context.pop)
        ],
      ),
      body: [
        filterItem(FilterOption.category, context.l10n.category, categoryName(),
            selectCategory),
        filterItem(
            FilterOption.genre, context.l10n.genre, genreName(), selectGenre),
        filterItem(FilterOption.country, context.l10n.country, countryName(),
            selectCountry),
        filterItem(FilterOption.serviceType, context.l10n.serviceType,
            serviceName(), selectService),
        const Spacer(),
        AppButton(
          height: 56,
          onPressed: () => context.pop(filter.value),
          child: context.l10n.search.toUpperCase().text2Bold,
        ),
      ]
          .toColumn()
          .padding(horizontal: AppSizes.p20, top: 40, bottom: 8)
          .safeArea(top: false),
    );
  }
}
