import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static const h1 = TextStyle(
      fontSize: 36,
      height: 44 / 36,
      fontWeight: FontWeight.w600,
      letterSpacing: 2);

  static final h1Outlined = h1.copyWith(
    foreground: Paint()
      ..color = AppColors.beige
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0,
  );

  static const h3 = TextStyle(
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 1);

  static const text2 =
      TextStyle(fontSize: 14, height: 18 / 14, letterSpacing: 1);

  static final text2Bold = text2.copyWith(fontWeight: FontWeight.w700);
}

extension TextStyleExt on String {
  Text get h1 => Text(toUpperCase(), style: AppStyles.h1);
  Text get h1Outlined => Text(toUpperCase(), style: AppStyles.h1Outlined);
  Text get h3 => Text(toUpperCase(), style: AppStyles.h3);
  Text get text2 => Text(this, style: AppStyles.text2);
  Text get text2Bold => Text(this, style: AppStyles.text2Bold);
}
