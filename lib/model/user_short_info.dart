import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '/ext/context_ext.dart';

part 'user_short_info.g.dart';

@JsonSerializable()
class UserShortInfo {
  final int id;
  final String name;
  final String slug;
  final int? selected;
  final String? image;
  final String? place;
  final String? placeEn;
  final String? shortDescription;

  UserShortInfo({
    required this.id,
    required this.name,
    required this.slug,
    this.selected,
    this.image,
    this.place,
    this.placeEn,
    this.shortDescription,
  });

  factory UserShortInfo.fromJson(Map<String, dynamic> json) =>
      _$UserShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserShortInfoToJson(this);

  String? getPlace(BuildContext context) => switch (context.lang) {
        'ru' => place,
        _ => placeEn ?? place,
      };
}
