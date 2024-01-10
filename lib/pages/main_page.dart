import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/components/misc/home_footer.dart';
import '/components/misc/home_header.dart';
import '/components/misc/text_stripe.dart';
import '/components/ribbons/category_paintings_ribbon.dart';
import '/components/ribbons/promo_ribbon.dart';
import '/ext/num_ext.dart';
import '/ext/widget_ext.dart';

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
      ].toColumn(separator: 80.gap).padding(bottom: 80),
      [
        const TextStripe(text: appTitle)
            .textStyle(style: const TextStyle(color: AppColors.beige))
            .rotate(angle: -0.14),
        const TextStripe(text: 'online art gallery').rotate(angle: 0.14),
      ].toStack().padding(top: 40, bottom: 120),
      const HomeFooter(),
    ].toColumn().padding(bottom: 80).scrollable();
  }
}
