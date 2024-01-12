import 'package:cherdak/components/filter/category_filter_item.dart';
import 'package:cherdak/components/filter/country_filter_item.dart';
import 'package:cherdak/components/filter/genre_filter_item.dart';
import 'package:cherdak/components/filter/service_filter_item.dart';
import 'package:cherdak/pages/filter_page.dart';
import 'package:cherdak/pages/filter_value_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_app.dart';
import '../tools/utils.dart';

void main() {
  const itemTypes = {
    FilterOption.category: CategoryFilterItem,
    FilterOption.genre: GenreFilterItem,
    FilterOption.country: CountryFilterItem,
    FilterOption.serviceType: ServiceFilterItem,
  };

  group('Filter page', () {
    testWidgets('displays all filter items pages', (tester) async {
      await tester.pumpWidget(
          mockApp(home: FilterPage(options: FilterOption.values.toSet())).app);
      await tester.pumpAndSettle();

      expect(find.byType(FilterPage), findsOneWidget);

      for (final item in itemTypes.entries) {
        final categoryItem = find.byType(item.value);
        expect(categoryItem, findsOneWidget);
        await tester.tap(categoryItem);
        await tester.pumpAndSettle();

        expect(find.byType(FilterValuePage), findsOneWidget);

        await tester.backPage();
        await tester.pumpAndSettle();
      }
    });
  });
}
