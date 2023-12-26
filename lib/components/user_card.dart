import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/app_colors.dart';
import '/app/app_const.dart';
import '/app/app_styles.dart';
import '/ext/app_ext.dart';
import '/ext/widget_ext.dart';
import '/ext/widget_list_ext.dart';
import '/model/user_info.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserInfo user;

  @override
  Widget build(BuildContext context) {
    void showUserPage() {
      // context.pushMaterial((_) => WorkPage(info: info));
    }

    return [
      CachedNetworkImage(
        imageUrl: '$avatarsBase/${user.image}',
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ).aspectRatio(aspectRatio: 1),
      [
        user.name.text2Bold.padding(bottom: 10),
        user.place.text2.textColor(AppColors.textLightGrey),
      ]
          .toColumnCrossStart()
          .padding(top: 12, bottom: 12, horizontal: 8)
          .textStyle(maxLines: 1, overflow: TextOverflow.ellipsis),
    ]
        .toColumnCrossStart()
        .decorated(
            position: DecorationPosition.foreground,
            border: Border.all(color: AppColors.lightGrey))
        .pressable(onPressed: showUserPage);
  }
}
