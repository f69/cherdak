import 'package:cherdak/app/app_colors.dart';
import 'package:cherdak/components/filter/category_filter_item.dart';
import 'package:cherdak/components/filter/country_filter_item.dart';
import 'package:cherdak/components/filter/genre_filter_item.dart';
import 'package:cherdak/components/filter/service_filter_item.dart';
import 'package:cherdak/pages/filter_page.dart';
import 'package:cherdak/pages/filter_value_page.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mock_app.dart';
import '../../tools/utils.dart';

void main() {
  const itemTypes = {
    FilterOption.category: CategoryFilterItem,
    FilterOption.genre: GenreFilterItem,
    FilterOption.country: CountryFilterItem,
    FilterOption.serviceType: ServiceFilterItem,
  };

  group('Filter page', () {
    testWidgets('displays all filter items pages and sets filter',
        (tester) async {
      final (:app, :container) =
          mockApp(home: FilterPage(options: FilterOption.values.toSet()));

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.byType(FilterPage), findsOneWidget);

      for (final item in itemTypes.entries) {
        final filterItem = find.byType(item.value);

        expect(filterItem, findsOneWidget);

        final initialFilter = container.read(internalFilterProvider);
        await tester.tap(filterItem);
        await tester.pumpAndSettle();

        expect(find.byType(FilterValuePage), findsOneWidget);

        var valueItems = find.descendant(
            of: find.byType(ListView), matching: find.byType(Text));

        // выбран первый элемент в списке значений
        // (у выбранного элемента цвет текста - null, у остальных -
        // AppColors.inactiveGrey)
        var firstItemWidget = tester.widget(valueItems.first) as Text;
        expect(firstItemWidget.style?.color, equals(null));

        // выбор второго элемента в списке значений
        await tester.tap(valueItems.at(1));
        await tester.pumpAndSettle();

        // фильтр изменился
        final newFilter = container.read(internalFilterProvider);
        expect(newFilter != initialFilter, isTrue);

        await tester.tap(filterItem);
        await tester.pumpAndSettle();

        valueItems = find.descendant(
            of: find.byType(ListView), matching: find.byType(Text));

        // выбран второй элемент в списке значений
        // (у выбранного элемента цвет текста - null, у остальных -
        // AppColors.inactiveGrey)
        firstItemWidget = tester.widget(valueItems.first) as Text;
        expect(firstItemWidget.style?.color, equals(AppColors.inactiveGrey));
        final secondItemWidget = tester.widget(valueItems.at(1)) as Text;
        expect(secondItemWidget.style?.color, equals(null));

        await tester.backPage();
        await tester.pumpAndSettle();
      }
    });
  });
}
