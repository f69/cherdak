// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'work_short_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkShortInfo _$WorkShortInfoFromJson(Map<String, dynamic> json) =>
    WorkShortInfo(
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      forSale: json['for_sale'] as bool,
      createdAt: json['created_at'] as String,
      mainImage: json['main_image'] as String,
      likesCount: json['likes_count'] as int,
    );

Map<String, dynamic> _$WorkShortInfoToJson(WorkShortInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'for_sale': instance.forSale,
      'created_at': instance.createdAt,
      'main_image': instance.mainImage,
      'likes_count': instance.likesCount,
    };
