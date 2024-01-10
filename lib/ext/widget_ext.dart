import 'package:flutter/material.dart';

extension StyledExt on Widget {
  Widget tooltip(
    String? message, {
    padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    margin = EdgeInsets.zero,
    preferBelow = false,
  }) =>
      Tooltip(
          preferBelow: preferBelow,
          padding: padding,
          margin: margin,
          message: message,
          child: this);

  // uses "2" suffix to overcome error? if widget has "padding" property
  // also, unlike StyledWidget.padding has EdgeInsets type parameter
  Widget padding2({
    EdgeInsets? padding,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Padding(
        padding: padding ??
            EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0,
            ),
        child: this,
      );

  Widget material({
    MaterialType type = MaterialType.canvas,
    double elevation = 0.0,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    TextStyle? textStyle,
    BorderRadiusGeometry? borderRadius,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    Clip clipBehavior = Clip.none,
    Duration animationDuration = kThemeChangeDuration,
  }) =>
      Material(
        type: type,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        shape: shape,
        borderOnForeground: borderOnForeground,
        clipBehavior: clipBehavior,
        animationDuration: animationDuration,
        child: this,
      );

  Widget tapSurface() => Material(
      type: MaterialType.canvas, color: Colors.transparent, child: this);

  // DefaultTextStyle wrapper
  Widget textStyle({
    bool merge = true,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    TextWidthBasis? textWidthBasis,
    // shorteners
    Color? color,
  }) =>
      merge
          ? DefaultTextStyle.merge(
              style: style ?? (color != null ? TextStyle(color: color) : null),
              textAlign: textAlign,
              softWrap: softWrap,
              overflow: overflow,
              maxLines: maxLines,
              textWidthBasis: textWidthBasis,
              child: this,
            )
          : DefaultTextStyle(
              style: style ?? TextStyle(color: color),
              textAlign: textAlign,
              softWrap: softWrap ?? true,
              overflow: overflow ?? TextOverflow.clip,
              maxLines: maxLines,
              textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
              child: this,
            );

  Widget iconTheme({
    IconThemeData? data,
    Color? color,
    double? size,
  }) =>
      IconTheme(
        data: data ?? IconThemeData(color: color, size: size),
        child: this,
      );
}
