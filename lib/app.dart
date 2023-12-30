import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_theme.dart';
import '/components/custom_scroll_behavior.dart';
import '/pages/home_page.dart';
import '/service/common_providers.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(langProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior:
          const CustomScrollBehavior(androidSdkVersion: 33).copyWith(
        dragDevices: PointerDeviceKind.values.toSet(),
        scrollbars: false,
      ),
      title: appTitle,
      theme: AppTheme.data,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLanguages.map((e) => Locale(e)).toList(),
      locale: (lang.isNotEmpty) ? Locale(lang) : null,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.background,
          // systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: const HomePage(),
      ),
    );
  }
}
