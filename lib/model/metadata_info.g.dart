// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetadataInfoCWProxy {
  MetadataInfo totalItems(int totalItems);

  MetadataInfo startItem(int? startItem);

  MetadataInfo endItem(int? endItem);

  MetadataInfo itemsPerPage(int itemsPerPage);

  MetadataInfo currentPage(int currentPage);

  MetadataInfo lastPage(int lastPage);

  MetadataInfo path(String path);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetadataInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetadataInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  MetadataInfo call({
    int? totalItems,
    int? startItem,
    int? endItem,
    int? itemsPerPage,
    int? currentPage,
    int? lastPage,
    String? path,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetadataInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetadataInfo.copyWith.fieldName(...)`
class _$MetadataInfoCWProxyImpl implements _$MetadataInfoCWProxy {
  const _$MetadataInfoCWProxyImpl(this._value);

  final MetadataInfo _value;

  @override
  MetadataInfo totalItems(int totalItems) => this(totalItems: totalItems);

  @override
  MetadataInfo startItem(int? startItem) => this(startItem: startItem);

  @override
  MetadataInfo endItem(int? endItem) => this(endItem: endItem);

  @override
  MetadataInfo itemsPerPage(int itemsPerPage) =>
      this(itemsPerPage: itemsPerPage);

  @override
  MetadataInfo currentPage(int currentPage) => this(currentPage: currentPage);

  @override
  MetadataInfo lastPage(int lastPage) => this(lastPage: lastPage);

  @override
  MetadataInfo path(String path) => this(path: path);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetadataInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetadataInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  MetadataInfo call({
    Object? totalItems = const $CopyWithPlaceholder(),
    Object? startItem = const $CopyWithPlaceholder(),
    Object? endItem = const $CopyWithPlaceholder(),
    Object? itemsPerPage = const $CopyWithPlaceholder(),
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? lastPage = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
  }) {
    return MetadataInfo(
      totalItems:
          totalItems == const $CopyWithPlaceholder() || totalItems == null
              ? _value.totalItems
              // ignore: cast_nullable_to_non_nullable
              : totalItems as int,
      startItem: startItem == const $CopyWithPlaceholder()
          ? _value.startItem
          // ignore: cast_nullable_to_non_nullable
          : startItem as int?,
      endItem: endItem == const $CopyWithPlaceholder()
          ? _value.endItem
          // ignore: cast_nullable_to_non_nullable
          : endItem as int?,
      itemsPerPage:
          itemsPerPage == const $CopyWithPlaceholder() || itemsPerPage == null
              ? _value.itemsPerPage
              // ignore: cast_nullable_to_non_nullable
              : itemsPerPage as int,
      currentPage:
          currentPage == const $CopyWithPlaceholder() || currentPage == null
              ? _value.currentPage
              // ignore: cast_nullable_to_non_nullable
              : currentPage as int,
      lastPage: lastPage == const $CopyWithPlaceholder() || lastPage == null
          ? _value.lastPage
          // ignore: cast_nullable_to_non_nullable
          : lastPage as int,
      path: path == const $CopyWithPlaceholder() || path == null
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String,
    );
  }
}

extension $MetadataInfoCopyWith on MetadataInfo {
  /// Returns a callable class that can be used as follows: `instanceOfMetadataInfo.copyWith(...)` or like so:`instanceOfMetadataInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetadataInfoCWProxy get copyWith => _$MetadataInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataInfo _$MetadataInfoFromJson(Map<String, dynamic> json) => MetadataInfo(
      totalItems: json['total'] as int,
      startItem: json['from'] as int?,
      endItem: json['to'] as int?,
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
