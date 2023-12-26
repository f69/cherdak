import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class PixelWrapped extends StatelessWidget {
  const PixelWrapped({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return UnconstrainedBox(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.topLeft,
        child: [
          child,
          child.translate(offset: Offset(-constraints.maxWidth, 0)),
        ].toColumn(mainAxisSize: MainAxisSize.min),
      );
    });
  }
}
