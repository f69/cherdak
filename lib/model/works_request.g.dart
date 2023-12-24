// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'works_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorksRequest _$WorksRequestFromJson(Map<String, dynamic> json) => WorksRequest(
      categoryId: json['category_id'] as int?,
      genreId: json['genre_id'] as int? ?? 0,
      countryId: json['country_id'] as int? ?? 0,
      genres: json['genres'] as List<dynamic>? ?? const [],
      sortType: json['sort_type'] as int? ?? 2,
      onlyPurchase: json['only_purchase'] as bool? ?? false,
      onlySelected: json['only_selected'] as bool? ?? true,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$WorksRequestToJson(WorksRequest instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'genre_id': instance.genreId,
      'country_id': instance.countryId,
      'genres': instance.genres,
      'sort_type': instance.sortType,
      'only_purchase': instance.onlyPurchase,
      'only_selected': instance.onlySelected,
      'user_id': instance.userId,
    };
