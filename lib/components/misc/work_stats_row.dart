import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/ext/widget_list_ext.dart';
import '/model/work_short_info.dart';

class WorkStatsRow extends StatelessWidget {
  const WorkStatsRow({super.key, required this.info});
  final WorkShortInfo info;

  Widget _statItem(IconData icon, int value) {
    return [Icon(icon).padding(right: 4), '$value'.text2Bold]
        .toRowMin()
        .center()
        .expanded();
  }

  @override
  Widget build(BuildContext context) {
    return [
      _statItem(CupertinoIcons.heart_fill, info.likesCount),
      _statItem(CupertinoIcons.eye_solid, 0),
      _statItem(CupertinoIcons.bubble_left_fill, 0),
    ].toRow(separator: const VerticalDivider()).height(44);
  }
}
