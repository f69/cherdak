import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  Locale get locale => Localizations.localeOf(this);

  String get lang => locale.languageCode;
}

extension ScaffoldExt on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);
}

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);

  bool get isDark => theme.brightness == Brightness.dark;

  TextTheme get textTheme => theme.textTheme;

  IconThemeData get iconTheme => IconTheme.of(this);

  Color get primaryColor => theme.primaryColor;

  Color get backgroundColor => theme.colorScheme.surface;

  Color get scaffoldBgColor => isCupertino
      ? cupertinoTheme.scaffoldBackgroundColor
      : theme.scaffoldBackgroundColor;

  Color get cardColor => theme.cardColor;

  Color get disabledColor => theme.disabledColor;

  Color disabledPaleColor([double divider = 3.0]) =>
      theme.disabledColor.withValues(alpha: theme.disabledColor.a / divider);

  Color get dividerColor => theme.dividerColor;

  Color? get bodyTextColor => theme.textTheme.bodyMedium?.color;

  ColorScheme get colorScheme => theme.colorScheme;

  TargetPlatform get platform => theme.platform;

  bool get isCupertino =>
      [TargetPlatform.iOS, TargetPlatform.macOS].contains(platform);

  bool get isMaterial => !isCupertino;

  String cupertinoUpper(String text) => isCupertino ? text.toUpperCase() : text;
}

extension NavigatorExt on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> push<T>(Route<T> route) => Navigator.push(this, route);

  Future<T?> pushMaterial<T>(
    WidgetBuilder builder, {
    bool fullScreenDialog = false,
  }) =>
      Navigator.push<T>(
        this,
        MaterialPageRoute(builder: builder, fullscreenDialog: fullScreenDialog),
      );

  Future<T?> pushPlatform<T>(
    WidgetBuilder builder, {
    bool fullScreenDialog = false,
    String? title,
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator).push<T>(
      isMaterial
          ? MaterialPageRoute(
              builder: builder, fullscreenDialog: fullScreenDialog)
          : CupertinoPageRoute(
              builder: builder,
              fullscreenDialog: fullScreenDialog,
              title: title,
            ),
    );
  }

  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  Future<T?> pushReplacement<T>(Route<T> route) =>
      Navigator.pushReplacement(this, route);

  Future<T?> pushReplacementMaterial<T>(WidgetBuilder builder) =>
      Navigator.pushReplacement(this, MaterialPageRoute(builder: builder));

  bool canPop() => Navigator.canPop(this);

  void popUntil(RoutePredicate predicate) =>
      Navigator.popUntil(this, predicate);
}

extension MediaQueryContext on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  EdgeInsets get padding => mediaQuery.padding;

  Brightness get platformBrightness => mediaQuery.platformBrightness;
}
