import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../components/user_works_ribbon.dart';
import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/components/base_app_bar.dart';
import '/components/user_name_header.dart';
import '/components/value_line.dart';
import '/ext/app_ext.dart';
import '/ext/context_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/user_info.dart';

class UserPage extends HookConsumerWidget {
  const UserPage({super.key, required this.user});
  final UserInfo user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BaseAppBar(
        leading: const Icon(Icons.arrow_back).pressable(onPressed: context.pop),
      ),
      body: [
        [
          UserNameHeader(name: user.name).padding(bottom: 8),
          ValueLine(context.l10n.rating, user.rate?.toString()),
          CachedNetworkImage(
            imageUrl: '$avatarsBase/${user.image}',
            errorWidget: (context, _, __) => avatarImageErrorWidget,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ).aspectRatio(aspectRatio: 1).padding(bottom: 16),
          ValueLine(context.l10n.phone, user.phone),
          ValueLine(context.l10n.email, user.email),
          ValueLine(context.l10n.place2, user.place),
          const Divider().padding(top: 40, bottom: 36),
          if (user.shortDescription != null) ...[
            context.l10n.aboutAuthor.h3.padding(bottom: 20),
            user.shortDescription!.text2SemiBold
                .textColor(AppColors.textLightGrey),
          ],
        ]
            .toColumnCrossStart()
            .padding(horizontal: AppSizes.p20)
            .padding(bottom: 40),
        UserWorksRibbon(userId: user.id),
      ].toColumnCrossStart().padding(vertical: 40).scrollable(),
    );
  }
}
