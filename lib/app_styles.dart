import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static const ultra = TextStyle(
      fontSize: 40,
      height: 48 / 40,
      fontVariations: [FontVariation.weight(800)],
      letterSpacing: 0);

  static final ultraOutlined = ultra.copyWith(
    letterSpacing: -1,
    foreground: Paint()
      ..color = AppColors.beige
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0,
  );

  static const h1 = TextStyle(
      fontSize: 36,
      height: 44 / 36,
      fontVariations: [FontVariation.weight(600)],
      letterSpacing: 0);

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

  static const text1 =
      TextStyle(fontSize: 16, height: 24 / 16, letterSpacing: 0);

  static final text1SemiBold = text1.copyWith(fontWeight: FontWeight.w600);

  static const text2 =
      TextStyle(fontSize: 14, height: 18 / 14, letterSpacing: 0.5);

  static final text2SemiBold = text2.copyWith(fontWeight: FontWeight.w600);
  static final text2Bold = text2.copyWith(fontWeight: FontWeight.w700);

  static const text3 =
      TextStyle(fontSize: 12, height: 14 / 12, letterSpacing: 0);

  static final text3Bold = text3.copyWith(fontWeight: FontWeight.w700);
}

extension TextStyleExt on String {
  Text get ultra => Text(toUpperCase(), style: AppStyles.ultra);
  Text get ultraOutlined => Text(toUpperCase(), style: AppStyles.ultraOutlined);
  Text get h1 => Text(toUpperCase(), style: AppStyles.h1);
  Text get h1Outlined => Text(toUpperCase(), style: AppStyles.h1Outlined);
  Text get h3 => Text(toUpperCase(), style: AppStyles.h3);
  Text get text1 => Text(this, style: AppStyles.text1);
  Text get text1SemiBold => Text(this, style: AppStyles.text1SemiBold);
  Text get text2 => Text(this, style: AppStyles.text2);
  Text get text2SemiBold => Text(this, style: AppStyles.text2SemiBold);
  Text get text2Bold => Text(this, style: AppStyles.text2Bold);
  Text get text3 => Text(this, style: AppStyles.text3);
  Text get text3Bold => Text(this, style: AppStyles.text3Bold);
}

class AppSizes {
  static const p20 = 20.0;
}
