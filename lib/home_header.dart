import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'app_colors.dart';
import 'pixel_wrapped.dart';
import 'app_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelWrapped(
      child: [
        [
          'cherdak'.h1,
          '.'.h1.textColor(AppColors.beige),
          'org'.h1,
        ].toRow(),
        'online'.h1Outlined,
        'art'.h1,
        'gallery'.h1Outlined,
      ].toRow(separator: const SizedBox(width: 20)).padding(left: 16),
    );
  }
}
