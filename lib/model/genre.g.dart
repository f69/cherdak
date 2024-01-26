// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      title: json['title'] as String,
      titleEn: json['title_en'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'title': instance.title,
      'title_en': instance.titleEn,
      'slug': instance.slug,
    };
