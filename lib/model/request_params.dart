import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_params.g.dart';

@CopyWith()
@JsonSerializable()
class RequestParams extends Equatable {
  const RequestParams({
    this.categoryId,
    this.genreId,
    this.countryId,
    this.genres = const [],
    this.sortType = 2,
    this.onlyPurchase = false,
    this.onlySelected = false,
    this.userId,
    this.searchString,
    this.countrySlug,
    this.serviceType,
  });

  final int? categoryId;
  final int? genreId;
  final int? countryId;
  final List? genres;
  final int sortType;
  final bool onlyPurchase;
  final bool onlySelected;
  final int? userId;
  final String? searchString;
  final String? countrySlug;
  @JsonKey(name: 'type')
  final String? serviceType;

  factory RequestParams.fromJson(Map<String, dynamic> json) =>
      _$RequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RequestParamsToJson(this);

  @override
  List<Object?> get props => [
        categoryId,
        genreId,
        countryId,
        genres,
        sortType,
        onlyPurchase,
        onlySelected,
        userId,
        searchString,
        countrySlug,
        serviceType,
      ];
}
