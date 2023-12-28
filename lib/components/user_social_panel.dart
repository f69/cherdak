import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '/app/app_colors.dart';
import '/ext/app_ext.dart';
import '/model/user_info.dart';

class UserSocialPanel extends StatelessWidget {
  const UserSocialPanel({super.key, required this.user});
  final UserInfo user;

  @override
  Widget build(BuildContext context) {
    Widget socialIcon(IconData icon, String? link) {
      if (link?.isNotEmpty ?? false) {
        return Icon(icon, size: 24, color: AppColors.textWhite)
            .pressable(onPressed: () => launchUrlString(link!))
            .padding(right: 16);
      } else {
        return const SizedBox.shrink();
      }
    }

    return [
      socialIcon(FontAwesomeIcons.instagram, user.insta),
      socialIcon(FontAwesomeIcons.facebookF, user.fb),
      socialIcon(FontAwesomeIcons.vk, user.vk),
      socialIcon(FontAwesomeIcons.internetExplorer, user.site),
      socialIcon(FontAwesomeIcons.behance, user.behance),
      socialIcon(FontAwesomeIcons.dribbble, user.dribbble),
    ].toRow();
  }
}
