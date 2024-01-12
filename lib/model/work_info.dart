import 'package:json_annotation/json_annotation.dart';

import '/model/category.dart';
import '/model/genre.dart';
import '/model/user_short_info.dart';

part 'work_info.g.dart';

@JsonSerializable()
class WorkInfo {
  const WorkInfo({
    required this.id,
    required this.title,
    required this.country,
    required this.countryId,
    required this.slug,
    this.author,
    this.creationDate,
    required this.technique,
    required this.description,
    required this.status,
    required this.price,
    required this.currency,
    required this.adult,
    this.isForSale,
    required this.image,
    required this.likesCount,
    required this.viewsCount,
    required this.category,
    required this.genre,
    required this.user,
    required this.liked,
  });

  final int id;
  final String title;
  final String country;
  final int countryId;
  final String slug;
  final String? author;
  final String? creationDate;
  final String? technique;
  final String description;
  final int status;
  final num price;
  final int currency;
  final int adult;
  final int? isForSale;
  final String image;
  final int likesCount;
  final int viewsCount;
  final Category category;
  final Genre genre;
  final UserShortInfo user;
  final bool liked;

  factory WorkInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkInfoToJson(this);
}

@JsonSerializable()
class WorkInfoResponse {
  WorkInfoResponse({
    required this.data,
  });

  final WorkInfo data;

  factory WorkInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkInfoResponseToJson(this);
}
