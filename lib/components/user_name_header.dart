import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_styles.dart';
import '/ext/widget_list_ext.dart';

class UserNameHeader extends StatelessWidget {
  const UserNameHeader({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final parts = name.split(' ');
    final first = parts.first;
    parts.removeAt(0);
    final other = parts.join(' ');
    return [
      first.h1.padding(right: 20),
      if (other.isNotEmpty) other.h1Outlined,
    ].toColumnCrossStart();
  }
}
