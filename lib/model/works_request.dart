import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'works_request.g.dart';

@JsonSerializable()
class WorksRequest extends Equatable {
  const WorksRequest({
    this.categoryId,
    this.genreId = 0,
    this.countryId = 0,
    this.genres = const [],
    this.sortType = 2,
    this.onlyPurchase = false,
    this.onlySelected = true,
    this.userId,
  });

  final int? categoryId;
  final int? genreId;
  final int? countryId;
  final List? genres;
  final int sortType;
  final bool onlyPurchase;
  final bool onlySelected;
  final int? userId;

  factory WorksRequest.fromJson(Map<String, dynamic> json) =>
      _$WorksRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WorksRequestToJson(this);

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
      ];
}
