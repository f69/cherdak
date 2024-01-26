// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'works_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorksInfoCWProxy {
  WorksInfo data(List<WorksItem> data);

  WorksInfo meta(MetadataInfo meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorksInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorksInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  WorksInfo call({
    List<WorksItem>? data,
    MetadataInfo? meta,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorksInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorksInfo.copyWith.fieldName(...)`
class _$WorksInfoCWProxyImpl implements _$WorksInfoCWProxy {
  const _$WorksInfoCWProxyImpl(this._value);

  final WorksInfo _value;

  @override
  WorksInfo data(List<WorksItem> data) => this(data: data);

  @override
  WorksInfo meta(MetadataInfo meta) => this(meta: meta);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorksInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorksInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  WorksInfo call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return WorksInfo(
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<WorksItem>,
      meta: meta == const $CopyWithPlaceholder() || meta == null
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as MetadataInfo,
    );
  }
}

extension $WorksInfoCopyWith on WorksInfo {
  /// Returns a callable class that can be used as follows: `instanceOfWorksInfo.copyWith(...)` or like so:`instanceOfWorksInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorksInfoCWProxy get copyWith => _$WorksInfoCWProxyImpl(this);
}

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
