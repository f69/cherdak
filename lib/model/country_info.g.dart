// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'country_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) => CountryInfo(
      id: json['id'] as int,
      title: json['title'] as String,
      titleEng: json['title_eng'] as String,
      titleBel: json['title_bel'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_eng': instance.titleEng,
      'title_bel': instance.titleBel,
      'slug': instance.slug,
    };

CountryInfoResponse _$CountryInfoResponseFromJson(Map<String, dynamic> json) =>
    CountryInfoResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => CountryInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryInfoResponseToJson(
        CountryInfoResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
