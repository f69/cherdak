import 'package:flutter/material.dart';

const appTitle = 'Cherdak Dalí';

const supportedLanguages = ['en', 'ru'];

const siteBase = 'https://cherdak.org';
const worksBase = '$siteBase/storage/works';
const worksThumbBase = '$siteBase/storage/works_small_images';
const avatarsBase = '$siteBase/storage/user_avatars';

const categories = {
  1: 'Живопись',
  4: 'Графика',
  3: 'HandMade',
  6: 'Скетч',
  5: 'Скульптура',
};

const serviceTypes = {
  'portrait': 'Портрет на заказ',
  'paint': 'Картина на заказ',
  'wall_painting': 'Роспись стен',
  'picture_from_photo': 'Картина по фотографии',
  'statue': 'Статуя на заказ',
  'handmade_toys': 'Игрушки ручной работы',
  'handmade_souvenirs': 'Сувениры ручной работы',
  'forging': 'Ковка на заказ',
  'leather': 'Изделия из кожи',
};

const workImageErrorWidget = Padding(
    padding: EdgeInsets.only(top: 40),
    child: Icon(Icons.brush_outlined, color: Colors.white12, size: 200));

const avatarImageErrorWidget = Padding(
    padding: EdgeInsets.only(top: 40),
    child: Icon(Icons.person_2_sharp, color: Colors.white12, size: 200));
