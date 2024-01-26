// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'service_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceInfo _$ServiceInfoFromJson(Map<String, dynamic> json) => ServiceInfo(
      slug: json['slug'] as String,
      name: json['name'] as String,
      rate: json['rate'] as int,
      image: json['image'] as String?,
      place: json['place'] as String,
      placeEn: json['place_en'] as String?,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceInfoToJson(ServiceInfo instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'rate': instance.rate,
      'image': instance.image,
      'place': instance.place,
      'place_en': instance.placeEn,
      'services': instance.services.map((e) => e.toJson()).toList(),
    };
