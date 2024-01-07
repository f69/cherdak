import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/service/common_providers.dart';

class MainMenuItem extends HookConsumerWidget {
  const MainMenuItem({
    super.key,
    required this.index,
    required this.caption,
    this.scaffoldContext,
  });

  final int index;
  final String caption;
  final BuildContext? scaffoldContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTab = ref.watch(homeTabProvider);

    void setTab() {
      ref.setHomeTab(HomeTab.values[index]);
      (scaffoldContext ?? context).scaffold.closeDrawer();
    }

    return caption.h1
        .textColor(index == homeTab.index ? AppColors.textWhite : null)
        .pressable(onPressed: setTab);
  }
}
