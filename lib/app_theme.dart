import 'app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

const kFontFamily = 'OpenSans';

class AppTheme {
  static ThemeData get data => getThemeData();

  static ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textWhite,
        titleTextStyle: AppStyles.text2Bold,
      ),
      fontFamily: kFontFamily,
    );
  }
}
