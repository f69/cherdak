import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/components/category_paintings_ribbon.dart';
import '/components/home_header.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      const HomeHeader().padding(vertical: 40),
      const CategoryPaintingsRibbon(categoryId: 1),
      const CategoryPaintingsRibbon(categoryId: 4),
      const CategoryPaintingsRibbon(categoryId: 6),
    ]
        .toColumn(separator: const SizedBox(height: 80))
        .padding(bottom: 80)
        .scrollable();
  }
}
