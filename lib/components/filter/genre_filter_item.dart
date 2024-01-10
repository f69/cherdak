import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/ext/context_ext.dart';
import '/model/request_params.dart';
import '/pages/filter_value_page.dart';
import '/service/common_providers.dart';
import '/service/data_providers.dart';
import 'filter_item.dart';

class GenreFilterItem extends HookConsumerWidget {
  const GenreFilterItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(internalFilterProvider);
    final genresList =
        ref.watch(genresProvider(filter.categoryId ?? 1)).valueOrNull;

    String? getGenreName() =>
        genresList?.firstWhereOrNull((e) => e.id == filter.genreId)?.title;

    void selectGenre() async {
      final selectedName = await context.pushMaterial((_) => FilterValuePage(
          caption: context.l10n.genre,
          values: [
            context.l10n.all,
            ...((genresList ?? []).map((e) => e.title))
          ],
          selectedValue: genresList
                  ?.firstWhereOrNull((e) => e.id == filter.genreId)
                  ?.title ??
              context.l10n.all));

      if (selectedName != null) {
        final selectedGenreId =
            genresList?.firstWhereOrNull((e) => e.title == selectedName)?.id;

        ref
            .watch(internalFilterProvider.notifier)
            .update((state) => state.copyWith(genreId: selectedGenreId));
      }
    }

    return FilterItem(
        text: context.l10n.genre,
        value: getGenreName(),
        onPressed: selectGenre);
  }
}
