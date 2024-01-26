import 'package:cherdak/app/app_colors.dart';
import 'package:cherdak/components/menu/main_menu_item.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mock_app.dart';

void main() {
  group('Main menu item', () {
    testWidgets('has light text color if selected', (tester) async {
      await tester.pumpWidget(mockApp(
        home: const MainMenuItem(itemTab: HomeTab.main, caption: 'test'),
      ).app);
      await tester.pumpAndSettle();
      expect(find.byType(MainMenuItem), findsOneWidget);

      final textWidget = tester.firstWidget(find.byType(Text)) as Text;

      expect(textWidget.style?.color, AppColors.textWhite);
    });

    testWidgets('has default text color if not selected', (tester) async {
      await tester.pumpWidget(mockApp(
        home: const MainMenuItem(itemTab: HomeTab.gallery, caption: 'test'),
      ).app);
      await tester.pumpAndSettle();
      expect(find.byType(MainMenuItem), findsOneWidget);

      final textWidget = tester.firstWidget(find.byType(Text)) as Text;

      expect(textWidget.style?.color, isNull);
    });

    testWidgets('sets home tab on tap', (tester) async {
      final (:app, :container) = mockApp(
        home: const Scaffold(
          body: MainMenuItem(itemTab: HomeTab.gallery, caption: 'test'),
        ),
      );
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.byType(MainMenuItem), findsOneWidget);
      expect(container.read(homeTabProvider), HomeTab.values[0]);

      await tester.tap(find.byType(MainMenuItem));
      await tester.pumpAndSettle();

      expect(container.read(homeTabProvider), HomeTab.values[1]);
    });
  });
}
