import 'package:json_annotation/json_annotation.dart';

import 'service.dart';

part 'service_info.g.dart';

@JsonSerializable()
class ServiceInfo {
  const ServiceInfo({
    required this.slug,
    required this.name,
    required this.rate,
    this.image,
    required this.place,
    this.placeEn,
    required this.services,
  });

  final String slug;
  final String name;
  final int rate;
  final String? image;
  final String place;
  final String? placeEn;
  final List<Service> services;

  factory ServiceInfo.fromJson(Map<String, dynamic> json) =>
      _$ServiceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceInfoToJson(this);
}
