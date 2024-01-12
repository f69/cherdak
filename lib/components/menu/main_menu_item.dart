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
    required this.itemTab,
    required this.caption,
    this.scaffoldContext,
  });

  final HomeTab itemTab;
  final String caption;
  final BuildContext? scaffoldContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTab = ref.watch(homeTabProvider);

    void setTab() {
      ref.setHomeTab(itemTab);
      (scaffoldContext ?? context).scaffold.closeDrawer();
    }

    return caption.h1
        .textColor(itemTab == homeTab ? AppColors.textWhite : null)
        .pressable(onPressed: setTab);
  }
}
