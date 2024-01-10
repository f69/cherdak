// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_params.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RequestParamsCWProxy {
  RequestParams categoryId(int? categoryId);

  RequestParams genreId(int? genreId);

  RequestParams countryId(int? countryId);

  RequestParams genres(List<dynamic>? genres);

  RequestParams sortType(int sortType);

  RequestParams onlyPurchase(bool onlyPurchase);

  RequestParams onlySelected(bool onlySelected);

  RequestParams userId(int? userId);

  RequestParams searchString(String? searchString);

  RequestParams countrySlug(String? countrySlug);

  RequestParams serviceType(String? serviceType);

  RequestParams excludeSlug(String? excludeSlug);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RequestParams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RequestParams(...).copyWith(id: 12, name: "My name")
  /// ````
  RequestParams call({
    int? categoryId,
    int? genreId,
    int? countryId,
    List<dynamic>? genres,
    int? sortType,
    bool? onlyPurchase,
    bool? onlySelected,
    int? userId,
    String? searchString,
    String? countrySlug,
    String? serviceType,
    String? excludeSlug,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRequestParams.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRequestParams.copyWith.fieldName(...)`
class _$RequestParamsCWProxyImpl implements _$RequestParamsCWProxy {
  const _$RequestParamsCWProxyImpl(this._value);

  final RequestParams _value;

  @override
  RequestParams categoryId(int? categoryId) => this(categoryId: categoryId);

  @override
  RequestParams genreId(int? genreId) => this(genreId: genreId);

  @override
  RequestParams countryId(int? countryId) => this(countryId: countryId);

  @override
  RequestParams genres(List<dynamic>? genres) => this(genres: genres);

  @override
  RequestParams sortType(int sortType) => this(sortType: sortType);

  @override
  RequestParams onlyPurchase(bool onlyPurchase) =>
      this(onlyPurchase: onlyPurchase);

  @override
  RequestParams onlySelected(bool onlySelected) =>
      this(onlySelected: onlySelected);

  @override
  RequestParams userId(int? userId) => this(userId: userId);

  @override
  RequestParams searchString(String? searchString) =>
      this(searchString: searchString);

  @override
  RequestParams countrySlug(String? countrySlug) =>
      this(countrySlug: countrySlug);

  @override
  RequestParams serviceType(String? serviceType) =>
      this(serviceType: serviceType);

  @override
  RequestParams excludeSlug(String? excludeSlug) =>
      this(excludeSlug: excludeSlug);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RequestParams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RequestParams(...).copyWith(id: 12, name: "My name")
  /// ````
  RequestParams call({
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? genreId = const $CopyWithPlaceholder(),
    Object? countryId = const $CopyWithPlaceholder(),
    Object? genres = const $CopyWithPlaceholder(),
    Object? sortType = const $CopyWithPlaceholder(),
    Object? onlyPurchase = const $CopyWithPlaceholder(),
    Object? onlySelected = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? searchString = const $CopyWithPlaceholder(),
    Object? countrySlug = const $CopyWithPlaceholder(),
    Object? serviceType = const $CopyWithPlaceholder(),
    Object? excludeSlug = const $CopyWithPlaceholder(),
  }) {
    return RequestParams(
      categoryId: categoryId == const $CopyWithPlaceholder()
          ? _value.categoryId
          // ignore: cast_nullable_to_non_nullable
          : categoryId as int?,
      genreId: genreId == const $CopyWithPlaceholder()
          ? _value.genreId
          // ignore: cast_nullable_to_non_nullable
          : genreId as int?,
      countryId: countryId == const $CopyWithPlaceholder()
          ? _value.countryId
          // ignore: cast_nullable_to_non_nullable
          : countryId as int?,
      genres: genres == const $CopyWithPlaceholder()
          ? _value.genres
          // ignore: cast_nullable_to_non_nullable
          : genres as List<dynamic>?,
      sortType: sortType == const $CopyWithPlaceholder() || sortType == null
          ? _value.sortType
          // ignore: cast_nullable_to_non_nullable
          : sortType as int,
      onlyPurchase:
          onlyPurchase == const $CopyWithPlaceholder() || onlyPurchase == null
              ? _value.onlyPurchase
              // ignore: cast_nullable_to_non_nullable
              : onlyPurchase as bool,
      onlySelected:
          onlySelected == const $CopyWithPlaceholder() || onlySelected == null
              ? _value.onlySelected
              // ignore: cast_nullable_to_non_nullable
              : onlySelected as bool,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int?,
      searchString: searchString == const $CopyWithPlaceholder()
          ? _value.searchString
          // ignore: cast_nullable_to_non_nullable
          : searchString as String?,
      countrySlug: countrySlug == const $CopyWithPlaceholder()
          ? _value.countrySlug
          // ignore: cast_nullable_to_non_nullable
          : countrySlug as String?,
      serviceType: serviceType == const $CopyWithPlaceholder()
          ? _value.serviceType
          // ignore: cast_nullable_to_non_nullable
          : serviceType as String?,
      excludeSlug: excludeSlug == const $CopyWithPlaceholder()
          ? _value.excludeSlug
          // ignore: cast_nullable_to_non_nullable
          : excludeSlug as String?,
    );
  }
}

extension $RequestParamsCopyWith on RequestParams {
  /// Returns a callable class that can be used as follows: `instanceOfRequestParams.copyWith(...)` or like so:`instanceOfRequestParams.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RequestParamsCWProxy get copyWith => _$RequestParamsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestParams _$RequestParamsFromJson(Map<String, dynamic> json) =>
    RequestParams(
      categoryId: json['category_id'] as int?,
      genreId: json['genre_id'] as int?,
      countryId: json['country_id'] as int?,
      genres: json['genres'] as List<dynamic>? ?? const [],
      sortType: json['sort_type'] as int? ?? 2,
      onlyPurchase: json['only_purchase'] as bool? ?? false,
      onlySelected: json['only_selected'] as bool? ?? false,
      userId: json['user_id'] as int?,
      searchString: json['search_string'] as String?,
      countrySlug: json['country_slug'] as String?,
      serviceType: json['type'] as String?,
      excludeSlug: json['exclude_slug'] as String?,
    );

Map<String, dynamic> _$RequestParamsToJson(RequestParams instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'genre_id': instance.genreId,
      'country_id': instance.countryId,
      'genres': instance.genres,
      'sort_type': instance.sortType,
      'only_purchase': instance.onlyPurchase,
      'only_selected': instance.onlySelected,
      'user_id': instance.userId,
      'search_string': instance.searchString,
      'country_slug': instance.countrySlug,
      'type': instance.serviceType,
      'exclude_slug': instance.excludeSlug,
    };
