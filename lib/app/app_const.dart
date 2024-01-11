import 'package:flutter/material.dart';

import '/ext/context_ext.dart';

const appTitle = 'Cherdak Dalí';

const supportedLanguages = ['en', 'ru'];

const siteBase = 'https://cherdak.org';
const worksBase = '$siteBase/storage/works';
const worksThumbBase = '$siteBase/storage/works_small_images';
const avatarsBase = '$siteBase/storage/user_avatars';

Map<int, String> getCategories(BuildContext context) => {
      1: context.l10n.painting,
      4: context.l10n.graphics,
      3: context.l10n.handMade,
      6: context.l10n.sketch,
      5: context.l10n.sculpture,
    };

Map<String, String> getServiceTypes(BuildContext context) => {
      "portrait": context.l10n.portrait,
      "paint": context.l10n.paint,
      "wall_painting": context.l10n.wall_painting,
      "picture_from_photo": context.l10n.picture_from_photo,
      "statue": context.l10n.statue,
      "handmade_toys": context.l10n.handmade_toys,
      "handmade_souvenirs": context.l10n.handmade_souvenirs,
      "forging": context.l10n.forging,
      "leather": context.l10n.leather,
    };

const workImageErrorWidget = Padding(
    padding: EdgeInsets.only(top: 40),
    child: Icon(Icons.brush_outlined, color: Colors.white12, size: 200));

const avatarImageErrorWidget = Padding(
    padding: EdgeInsets.only(top: 40),
    child: Icon(Icons.person_2_sharp, color: Colors.white12, size: 200));
