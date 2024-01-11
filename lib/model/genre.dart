import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '/ext/context_ext.dart';

part 'genre.g.dart';

@JsonSerializable(explicitToJson: true)
class Genre {
  const Genre({
    required this.title,
    required this.titleEn,
    required this.slug,
  });

  final String title;
  final String titleEn;
  final String slug;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  String getTitle(BuildContext context) => switch (context.lang) {
        'ru' => title,
        _ => titleEn,
      };
}
