import 'package:cherdak/components/filter/country_filter_item.dart';
import 'package:cherdak/pages/filter_value_page.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mock_app.dart';
import '../../../mocks/mock_data.dart';

void main() {
  group('Country filter item', () {
    testWidgets('selects specific country and all countries', (tester) async {
      final (:app, :container) = mockApp(home: const CountryFilterItem());

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      final filterItem = find.byType(CountryFilterItem);
      expect(filterItem, findsWidgets);

      await tester.tap(filterItem);
      await tester.pumpAndSettle();

      expect(find.byType(FilterValuePage), findsOneWidget);

      // выбор страны
      final valueItem = find.text(mockCountryInfo.title);
      expect(valueItem, findsOneWidget);

      await tester.tap(valueItem);
      await tester.pumpAndSettle();

      final selectedCountryId =
          container.read(internalFilterProvider).countryId;
      expect(selectedCountryId, equals(mockCountryInfo.id));

      await tester.tap(filterItem);
      await tester.pumpAndSettle();

      // выбор первого элемента в списке - Все страны
      final valueItems = find.descendant(
          of: find.byType(ListView), matching: find.byType(Text));
      await tester.tap(valueItems.first);
      await tester.pumpAndSettle();

      final selectedCountryId2 =
          container.read(internalFilterProvider).countryId;
      expect(selectedCountryId2, equals(null));
    });
  });
}
