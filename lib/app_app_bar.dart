import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return [
      AppBar(
        leading: leading,
        title: title,
        actions: [...(actions ?? []), const SizedBox(width: 20)],
        centerTitle: true,
      ).padding(top: 4),
      const Divider(
        height: 1,
        color: AppColors.lightGrey,
        indent: 20,
        endIndent: 20,
      ).alignment(Alignment.bottomCenter),
    ].toStack();
  }

  @override
  Size get preferredSize => const Size.fromHeight(38 + 24);
}
