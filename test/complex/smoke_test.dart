import 'package:cherdak/components/home_header.dart';
import 'package:cherdak/pages/main_menu_page.dart';
import 'package:cherdak/components/promo_ribbon.dart';
import 'package:cherdak/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_app.dart';

void main() {
  group('Smoke test displays', () {
    testWidgets('main page', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.pumpAndSettle();
      expect(find.byType(MainPage), findsOneWidget);
    });

    testWidgets('main menu', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.pumpAndSettle();

      final menuButton = find.byIcon(Icons.menu);
      await tester.tap(menuButton);
      await tester.pumpAndSettle();
      expect(find.byType(MainMenuPage), findsOneWidget);
    });
  });
}
