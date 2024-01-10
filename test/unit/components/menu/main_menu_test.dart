import 'package:cherdak/app/app_colors.dart';
import 'package:cherdak/components/menu/main_menu.dart';
import 'package:cherdak/components/menu/main_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mock_app.dart';

void main() {
  group('Main menu', () {
    testWidgets('shows only one item selected', (tester) async {
      await tester.pumpWidget(mockApp(home: const MainMenu()).app);
      await tester.pumpAndSettle();
      expect(find.byType(MainMenuItem), findsWidgets);

      final textWidgets = tester.widgetList<Text>(find.byType(Text));
      expect(
          textWidgets
              .where((e) => e.style?.color == AppColors.textWhite)
              .length,
          equals(1));
    });
  });
}
