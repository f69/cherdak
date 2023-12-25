import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'genre_info.g.dart';

@JsonSerializable(explicitToJson: true)
class GenreInfo {
  final int id;
  final String title;
  final String titleEng;
  final String titleBel;
  final String slug;
  final Category category;
  final String? description;

  GenreInfo({
    required this.id,
    required this.title,
    required this.titleEng,
    required this.titleBel,
    required this.slug,
    required this.category,
    this.description,
  });

  factory GenreInfo.fromJson(Map<String, dynamic> json) =>
      _$GenreInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreInfoToJson(this);
}

@JsonSerializable()
class GenreInfoResponse {
  GenreInfoResponse({
    required this.data,
  });

  final List<GenreInfo> data;

  factory GenreInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreInfoResponseToJson(this);
}
