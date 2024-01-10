import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/ext/context_ext.dart';
import '/widgets/pixel_wrapped.dart';
import '../buttons/more_about_button.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final titleText = '$appTitle — ${context.l10n.inspirational}';
    return [
      PixelWrapped(child: titleText.h1.padding(left: 16)),
      [
        [
          Image.asset('assets/images/banner2.jpg', fit: BoxFit.cover)
              .padding(top: 16),
          Styled.widget()
              .backgroundColor(Colors.black.withOpacity(0.4))
              .positioned(top: 0, left: 0, right: 0, bottom: 0),
          context.l10n.art.h1Outlined.alignment(Alignment.topRight),
        ].toStack().padding(bottom: 16),
        context.l10n.cherdakMain.text2SemiBold,
      ].toColumn().padding(horizontal: AppSizes.p20),
      const MoreAboutButton().alignment(Alignment.topRight).padding(top: 40),
    ].toColumn();
  }
}
