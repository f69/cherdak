import 'dart:math';

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/ext/widget_list_ext.dart';

class SimpleGrid extends StatelessWidget {
  const SimpleGrid({
    super.key,
    required this.columns,
    this.verticalSpacing = 0,
    this.horizontalSpacing = 0,
    required this.children,
  });

  final List<Widget> children;
  final int columns;
  final double verticalSpacing;
  final double horizontalSpacing;

  @override
  Widget build(BuildContext context) {
    final result = <Widget>[];

    final items = children.map((e) => e.expanded()).toList();
    while (items.isNotEmpty) {
      final rowItems = items.take(columns).toList();
      while (rowItems.length < columns) {
        rowItems.add(const Spacer());
      }
      items.removeRange(0, min(columns, items.length));
      result.add(rowItems.toRowCrossStart(
          separator: SizedBox(width: horizontalSpacing)));
    }

    return result.toColumnMin(separator: SizedBox(height: verticalSpacing));
  }
}
