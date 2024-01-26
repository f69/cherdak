// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as int,
      slug: json['slug'] as String,
      name: json['name'] as String,
      selected: json['selected'] as int?,
      countryId: json['country_id'] as int?,
      country: json['country'] as String?,
      countryEn: json['country_en'] as String?,
      city: json['city'] as String?,
      image: json['image'] as String?,
      shortDescription: json['short_description'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      about: json['about'] as String?,
      vk: json['vk'] as String?,
      fb: json['fb'] as String?,
      insta: json['insta'] as String?,
      twitter: json['twitter'] as String?,
      site: json['site'] as String?,
      behance: json['behance'] as String?,
      dribbble: json['dribbble'] as String?,
      rate: json['rate'] as int?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'selected': instance.selected,
      'country_id': instance.countryId,
      'country': instance.country,
      'country_en': instance.countryEn,
      'city': instance.city,
      'image': instance.image,
      'short_description': instance.shortDescription,
      'phone': instance.phone,
      'email': instance.email,
      'about': instance.about,
      'vk': instance.vk,
      'fb': instance.fb,
      'insta': instance.insta,
      'twitter': instance.twitter,
      'site': instance.site,
      'behance': instance.behance,
      'dribbble': instance.dribbble,
      'rate': instance.rate,
    };
