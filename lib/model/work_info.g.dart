// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'work_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkInfo _$WorkInfoFromJson(Map<String, dynamic> json) => WorkInfo(
      id: json['id'] as int,
      title: json['title'] as String,
      country: json['country'] as String,
      countryId: json['country_id'] as int,
      slug: json['slug'] as String,
      author: json['author'] as String?,
      creationDate: json['creation_date'] as String?,
      technique: json['technique'] as String?,
      description: json['description'] as String,
      status: json['status'] as int,
      price: json['price'] as num,
      currency: json['currency'] as int,
      adult: json['adult'] as int,
      isForSale: json['is_for_sale'] as int?,
      image: json['image'] as String,
      likesCount: json['likes_count'] as int,
      viewsCount: json['views_count'] as int,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
      user: UserShortInfo.fromJson(json['user'] as Map<String, dynamic>),
      liked: json['liked'] as bool,
    );

Map<String, dynamic> _$WorkInfoToJson(WorkInfo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'country': instance.country,
      'country_id': instance.countryId,
      'slug': instance.slug,
      'author': instance.author,
      'creation_date': instance.creationDate,
      'technique': instance.technique,
      'description': instance.description,
      'status': instance.status,
      'price': instance.price,
      'currency': instance.currency,
      'adult': instance.adult,
      'is_for_sale': instance.isForSale,
      'image': instance.image,
      'likes_count': instance.likesCount,
      'views_count': instance.viewsCount,
      'category': instance.category.toJson(),
      'genre': instance.genre.toJson(),
      'user': instance.user.toJson(),
      'liked': instance.liked,
    };

WorkInfoResponse _$WorkInfoResponseFromJson(Map<String, dynamic> json) =>
    WorkInfoResponse(
      data: WorkInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkInfoResponseToJson(WorkInfoResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };
