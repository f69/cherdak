// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'user_short_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserShortInfo _$UserShortInfoFromJson(Map<String, dynamic> json) =>
    UserShortInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      selected: json['selected'] as int?,
      image: json['image'] as String?,
      place: json['place'] as String?,
      placeEn: json['place_en'] as String?,
      shortDescription: json['short_description'] as String?,
    );

Map<String, dynamic> _$UserShortInfoToJson(UserShortInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'selected': instance.selected,
      'image': instance.image,
      'place': instance.place,
      'place_en': instance.placeEn,
      'short_description': instance.shortDescription,
    };
