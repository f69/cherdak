// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesInfo _$ServicesInfoFromJson(Map<String, dynamic> json) => ServicesInfo(
      data: (json['data'] as List<dynamic>)
          .map((e) => ServiceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetadataInfo.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServicesInfoToJson(ServicesInfo instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
