import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_params.g.dart';

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
      ];
}
