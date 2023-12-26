import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return [
      AppBar(
        leading: leading,
        title: title ?? const Text(appTitle),
        actions: [...(actions ?? []), const SizedBox(width: 20)],
        centerTitle: centerTitle,
        automaticallyImplyLeading: automaticallyImplyLeading,
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
