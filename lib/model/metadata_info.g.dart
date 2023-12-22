// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataInfo _$MetadataInfoFromJson(Map<String, dynamic> json) => MetadataInfo(
      totalItems: json['total'] as int,
      startItem: json['from'] as int,
      endItem: json['to'] as int,
      itemsPerPage: json['per_page'] as int,
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      path: json['path'] as String,
    );

Map<String, dynamic> _$MetadataInfoToJson(MetadataInfo instance) =>
    <String, dynamic>{
      'total': instance.totalItems,
      'from': instance.startItem,
      'to': instance.endItem,
      'per_page': instance.itemsPerPage,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'path': instance.path,
    };
