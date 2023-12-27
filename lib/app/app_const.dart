import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

const appTitle = 'Cherdak Dalí';

const supportedLanguages = ['en', 'ru'];

const siteBase = 'https://cherdak.org';
const worksBase = '$siteBase/storage/works';
const worksThumbBase = '$siteBase/storage/works_small_images';
const avatarsBase = '$siteBase/storage/user_avatars';

const categories = {
  1: "Живопись",
  4: "Графика",
  3: "HandMade",
  6: "Скетч",
  5: "Скульптура",
};

final avatarImageErrorWidget =
    const Icon(Icons.person_2_sharp, color: Colors.white12, size: 200)
        .padding(top: 40);
