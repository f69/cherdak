import 'package:cherdak/model/category.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mock_app.dart';
import '../../../mocks/mock_json.dart';
import '../../../tools/utils.dart';

void main() {
  group('Category', () {
    test('is constructed from JSON', () {
      final data = Category.fromJson(mockCategoryJson);
      expect(data.title, equals(mockCategoryJson['title']));
    });

    test('produces the same JSON', () {
      final data = Category.fromJson(mockCategoryJson);
      final json = data.toJson();
      expect(mapsEqual(json, mockCategoryJson), isTrue);
    });

    testWidgets('gives localized title', (tester) async {
      final category = Category.fromJson(mockCategoryJson);
      await tester.pumpWidget(mockApp(
        overrides: [langProvider.overrideWith((ref) => 'en')],
        home: Builder(
          builder: (context) => Text(category.getTitle(context)),
        ),
      ).app);
      expect(find.text(category.titleEn!), findsOneWidget);
    });
  });
}
