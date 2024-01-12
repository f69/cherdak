import 'package:cherdak/components/menu/main_menu_item.dart';
import 'package:cherdak/pages/about_page.dart';
import 'package:cherdak/pages/authors_page.dart';
import 'package:cherdak/pages/filter_page.dart';
import 'package:cherdak/pages/gallery_page.dart';
import 'package:cherdak/pages/main_menu_page.dart';
import 'package:cherdak/pages/main_page.dart';
import 'package:cherdak/pages/services_page.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_app.dart';

void main() {
  group('Smoke test displays', () {
    testWidgets('home page', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.pumpAndSettle();
      expect(find.byType(MainPage), findsOneWidget);
    });

    testWidgets('main menu', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.pump();
      await tester.showMainMenu();
      expect(find.byType(MainMenuPage), findsOneWidget);
    });

    testWidgets('all home page tabs', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.pump();

      await tester.selectHomeTab(HomeTab.gallery);
      expect(find.byType(GalleryPage), findsOneWidget);
      await tester.selectHomeTab(HomeTab.services);
      expect(find.byType(ServicesPage), findsOneWidget);
      await tester.selectHomeTab(HomeTab.authors);
      expect(find.byType(AuthorsPage), findsOneWidget);
      await tester.selectHomeTab(HomeTab.about);
      expect(find.byType(AboutPage), findsOneWidget);
    });

    testWidgets('filter page', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.pump();

      await tester.selectHomeTab(HomeTab.gallery);
      await tester.showFilterPage();
      expect(find.byType(FilterPage), findsOneWidget);

      await tester.closePage();
      await tester.selectHomeTab(HomeTab.services);
      await tester.showFilterPage();
      expect(find.byType(FilterPage), findsOneWidget);

      await tester.closePage();
      await tester.selectHomeTab(HomeTab.authors);
      await tester.showFilterPage();
      expect(find.byType(FilterPage), findsOneWidget);
    });
  });
}

extension AppTestExt on WidgetTester {
  Future<void> showMainMenu() async {
    final menuButton = find.byIcon(Icons.menu);
    await tap(menuButton);
    await pumpAndSettle();
  }

  Future<void> selectHomeTab(HomeTab tab) async {
    await showMainMenu();
    final menuItems = find.byType(MainMenuItem);
    await tap(menuItems.at(tab.index));
    await pumpAndSettle();
  }

  Future<void> showFilterPage() async {
    final filterButton = find.byIcon(Icons.tune);
    await tap(filterButton);
    await pumpAndSettle();
  }

  Future<void> closePage() async {
    final closeButton = find.byIcon(Icons.close);
    await tap(closeButton);
    await pumpAndSettle();
  }
}
