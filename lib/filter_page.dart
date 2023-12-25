import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app_button.dart';
import '/app_const.dart';
import '/app_styles.dart';
import '/base_app_bar.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/num_ext.dart';
import '/model/works_request.dart';
import '/service/data_providers.dart';
import '/service/works_provider.dart';
import 'app_colors.dart';

class FilterPage extends HookConsumerWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(worksFilterProvider);
    final filter = useState(currentFilter);
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

    int getCategoryIdByName(String name) {
      for (final entry in categories.entries) {
        if (entry.value == name) return entry.key;
      }
      return 1;
    }

    void selectCategory() async {
      final value = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.category,
          values: categories.values.toList(),
          selectedValue: categories[filter.value.categoryId ?? 1]));
      if (value != null) {
        filter.value = WorksRequest(
          categoryId: getCategoryIdByName(value),
          countryId: filter.value.countryId,
        );
      }
    }

    void selectGenre() async {
      final value = await context.pushMaterial((_) => FilterValuePage(
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
      if (value != null) {
        filter.value = WorksRequest(
          categoryId: filter.value.categoryId,
          genreId: genresList?.firstWhereOrNull((e) => e.title == value)?.id,
          countryId: filter.value.countryId,
        );
      }
    }

    void selectCountry() async {
      final value = await context.pushMaterial((_) => FilterValuePage(
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
      if (value != null) {
        filter.value = WorksRequest(
          categoryId: filter.value.categoryId,
          genreId: filter.value.genreId,
          countryId:
              countriesList?.firstWhereOrNull((e) => e.title == value)?.id,
        );
      }
    }

    Widget item(String text, String? value) => [
          text.text1SemiBold,
          const Spacer(),
          (value ?? context.l10n.all).text1.textColor(AppColors.textLightGrey),
          8.gap,
          const Icon(Icons.arrow_forward_ios, color: AppColors.beige)
        ]
            .toRow()
            .padding(bottom: 8)
            .border(bottom: 1, color: AppColors.grey)
            .padding(bottom: 28);

    return Scaffold(
      appBar: BaseAppBar(
        title: context.l10n.filter.text2Bold.padding(left: 4),
        centerTitle: false,
        actions: [const Icon(Icons.close).pressable(onPressed: context.pop)],
      ),
      body: [
        item(context.l10n.category, categoryName())
            .pressable(onPressed: selectCategory),
        item(context.l10n.genre, genreName()).pressable(onPressed: selectGenre),
        item(context.l10n.country, countryName())
            .pressable(onPressed: selectCountry),
        const Spacer(),
        AppButton(
          height: 56,
          onPressed: () {
            ref.read(worksFilterProvider.notifier).state = filter.value;
            context.pop();
          },
          child: context.l10n.search.toUpperCase().text2Bold,
        ),
      ]
          .toColumn()
          .padding(horizontal: AppSizes.p20, top: 40, bottom: 8)
          .safeArea(top: false),
    );
  }
}

class FilterValuePage extends StatelessWidget {
  const FilterValuePage({
    super.key,
    required this.caption,
    required this.values,
    required this.selectedValue,
  });
  final String caption;
  final List<String> values;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: caption.text2Bold,
        leading: const Icon(Icons.arrow_back).pressable(onPressed: context.pop),
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.p20, vertical: 16),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          final color = value == selectedValue ? null : AppColors.inactiveGrey;

          return value.text1SemiBold
              .textColor(color)
              .padding(vertical: 8)
              .pressable(onPressed: () => context.pop(value));
        },
      ),
    );
  }
}
