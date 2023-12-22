import 'package:json_annotation/json_annotation.dart';

part 'work_short_info.g.dart';

@JsonSerializable()
class WorkShortInfo {
  final int id;
  final String title;
  final String slug;
  final bool forSale;
  final String createdAt;
  final String mainImage;
  final int likesCount;

  WorkShortInfo({
    required this.id,
    required this.title,
    required this.slug,
    required this.forSale,
    required this.createdAt,
    required this.mainImage,
    required this.likesCount,
  });

  factory WorkShortInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkShortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkShortInfoToJson(this);
}
