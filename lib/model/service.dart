import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  final String title;
  final String? titleEn;
  final String slug;
  final String? description;

  Service({
    required this.title,
    this.titleEn,
    required this.slug,
    this.description,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
