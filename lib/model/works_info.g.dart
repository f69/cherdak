// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'works_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorksInfo _$WorksInfoFromJson(Map<String, dynamic> json) => WorksInfo(
      data: (json['data'] as List<dynamic>)
          .map((e) => WorksItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetadataInfo.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorksInfoToJson(WorksInfo instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
