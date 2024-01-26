// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'genre_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreInfo _$GenreInfoFromJson(Map<String, dynamic> json) => GenreInfo(
      id: json['id'] as int,
      title: json['title'] as String,
      titleEng: json['title_eng'] as String,
      titleBel: json['title_bel'] as String,
      slug: json['slug'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GenreInfoToJson(GenreInfo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_eng': instance.titleEng,
      'title_bel': instance.titleBel,
      'slug': instance.slug,
      'category': instance.category.toJson(),
      'description': instance.description,
    };

GenreInfoResponse _$GenreInfoResponseFromJson(Map<String, dynamic> json) =>
    GenreInfoResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => GenreInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenreInfoResponseToJson(GenreInfoResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
