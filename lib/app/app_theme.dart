import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

const kFontFamily = 'OpenSans';

class AppTheme {
  static ThemeData get data => getThemeData();

  static ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      fontFamily: kFontFamily,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textWhite,
        titleTextStyle: AppStyles.text2Bold.copyWith(fontFamily: kFontFamily),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightGrey,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.iconGrey,
        size: 24,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusColor: AppColors.textWhite,
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        fillColor: Colors.white12,
        filled: true,
        isDense: true,
      ),
    );
  }
}
