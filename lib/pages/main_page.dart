import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/components/category_paintings_ribbon.dart';
import '/components/home_header.dart';
import '/components/promo_ribbon.dart';
import '/ext/num_ext.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      const HomeHeader().padding(vertical: 40),
      const PromoRibbon().padding(bottom: 60),
      [
        const CategoryPaintingsRibbon(categoryId: 1),
        const CategoryPaintingsRibbon(categoryId: 4),
        const CategoryPaintingsRibbon(categoryId: 6),
      ].toColumn(separator: 80.gap),
    ].toColumn().padding(bottom: 80).scrollable();
  }
}
