import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPressed,
    this.pressedOpacity = 1.0,
    this.ripple = false,
    this.pressedForegroundColor,
    this.pressedBackgroundColor,
    this.isPressed = false,
  });
  final Widget child;
  final double pressedOpacity;
  final bool ripple;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Color? pressedForegroundColor;
  final Color? pressedBackgroundColor;
  final bool isPressed;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _pressed = false;

  @override
  void didUpdateWidget(covariant Pressable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPressed != oldWidget.isPressed) {
      _pressed = widget.isPressed;
      if (widget.isPressed) {
        Future.delayed(Duration.zero, () => widget.onPressed?.call());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = widget.child;

    if (widget.pressedForegroundColor != null && _pressed) {
      result = DefaultTextStyle(
        style: TextStyle(color: widget.pressedForegroundColor),
        child: IconTheme(
          data: IconThemeData(color: widget.pressedForegroundColor),
          child: result,
        ),
      );
    }
    result = result
        .opacity(_pressed ? widget.pressedOpacity : 1.0, animate: true)
        .decorated(
            color: _pressed ? widget.pressedBackgroundColor : null,
            animate: true)
        .animate(const Duration(milliseconds: 200), Curves.decelerate);

    if (widget.ripple) result = result.ripple();

    return result.gestures(
      onTapDown: (_) => setState(() => _pressed = widget.onPressed != null),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      onLongPress: widget.onLongPressed,
    );
  }
}
