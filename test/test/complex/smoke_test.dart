import 'package:cherdak/components/cards/user_card.dart';
import 'package:cherdak/components/cards/work_card.dart';
import 'package:cherdak/pages/about_page.dart';
import 'package:cherdak/pages/authors_page.dart';
import 'package:cherdak/pages/filter_page.dart';
import 'package:cherdak/pages/gallery_page.dart';
import 'package:cherdak/pages/main_menu_page.dart';
import 'package:cherdak/pages/main_page.dart';
import 'package:cherdak/pages/services_page.dart';
import 'package:cherdak/pages/user_page.dart';
import 'package:cherdak/pages/work_page.dart';
import 'package:cherdak/service/common_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mock_app.dart';
import '../../tools/utils.dart';

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

    testWidgets('work page', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.setSurfaceSize(const Size(400, 800));
      await tester.pump();

      await tester.selectHomeTab(HomeTab.gallery);
      final workCards = find.byType(WorkCard);
      await tester.tap(workCards.first);
      await tester.pumpAndSettle();

      expect(find.byType(WorkPage), findsOneWidget);
    });

    testWidgets('user page', (tester) async {
      await tester.pumpWidget(mockApp().app);
      await tester.setSurfaceSize(const Size(400, 800));
      await tester.pump();

      await tester.selectHomeTab(HomeTab.authors);
      final userCards = find.byType(UserCard);
      await tester.tap(userCards.first);
      await tester.pumpAndSettle();

      expect(find.byType(UserPage), findsOneWidget);
    });
  });
}
