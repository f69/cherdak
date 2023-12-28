// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      title: json['title'] as String,
      titleEn: json['title_en'] as String?,
      slug: json['slug'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'title': instance.title,
      'title_en': instance.titleEn,
      'slug': instance.slug,
      'description': instance.description,
    };
