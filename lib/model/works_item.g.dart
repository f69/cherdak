// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'works_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorksItem _$WorksItemFromJson(Map<String, dynamic> json) => WorksItem(
      work: WorkShortInfo.fromJson(json['work'] as Map<String, dynamic>),
      liked: json['liked'] as bool,
      user: UserShortInfo.fromJson(json['user'] as Map<String, dynamic>),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorksItemToJson(WorksItem instance) => <String, dynamic>{
      'work': instance.work.toJson(),
      'user': instance.user.toJson(),
      'category': instance.category.toJson(),
      'genre': instance.genre.toJson(),
      'liked': instance.liked,
    };
