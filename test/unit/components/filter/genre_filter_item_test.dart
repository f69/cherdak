import 'package:cherdak/components/filter/genre_filter_item.dart';
import 'package:cherdak/pages/filter_value_page.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mock_app.dart';
import '../../../mocks/mock_data.dart';

void main() {
  group('Genre filter item', () {
    testWidgets('selects specific genre and all genres', (tester) async {
      final (:app, :container) = mockApp(home: const GenreFilterItem());

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      final filterItem = find.byType(GenreFilterItem);
      expect(filterItem, findsWidgets);

      await tester.tap(filterItem);
      await tester.pumpAndSettle();

      expect(find.byType(FilterValuePage), findsOneWidget);

      // выбор жанра
      final valueItem = find.text(mockGenreInfo.title);
      expect(valueItem, findsOneWidget);

      await tester.tap(valueItem);
      await tester.pumpAndSettle();

      final selectedGenreId = container.read(internalFilterProvider).genreId;
      expect(selectedGenreId, equals(mockGenreInfo.id));

      await tester.tap(filterItem);
      await tester.pumpAndSettle();

      // выбор первого элемента в списке - Все жанры
      final valueItems = find.descendant(
          of: find.byType(ListView), matching: find.byType(Text));
      await tester.tap(valueItems.first);
      await tester.pumpAndSettle();

      final selectedGenreId2 = container.read(internalFilterProvider).genreId;
      expect(selectedGenreId2, equals(null));
    });
  });
}
