import 'package:json_annotation/json_annotation.dart';

part 'works_request.g.dart';

@JsonSerializable()
class WorksRequest {
  final int? categoryId;
  final int? genreId;
  final int? countryId;
  final List? genres;
  final int sortType;
  final bool onlyPurchase;
  final bool onlySelected;

  WorksRequest({
    this.categoryId,
    this.genreId = 0,
    this.countryId = 0,
    this.genres = const [],
    this.sortType = 2,
    this.onlyPurchase = false,
    this.onlySelected = true,
  });

  factory WorksRequest.fromJson(Map<String, dynamic> json) =>
      _$WorksRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WorksRequestToJson(this);
}
