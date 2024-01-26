// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'users_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersInfo _$UsersInfoFromJson(Map<String, dynamic> json) => UsersInfo(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetadataInfo.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersInfoToJson(UsersInfo instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
