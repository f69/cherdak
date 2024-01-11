import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '/ext/context_ext.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  const Category({
    required this.title,
    this.titleEn,
    required this.slug,
  });

  final String title;
  final String? titleEn;
  final String slug;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  String getTitle(BuildContext context) => switch (context.lang) {
        'ru' => title,
        _ => titleEn ?? title,
      };
}
