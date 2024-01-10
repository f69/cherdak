import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata_info.g.dart';

@CopyWith()
@JsonSerializable()
class MetadataInfo extends Equatable {
  const MetadataInfo({
    required this.totalItems,
    required this.startItem,
    required this.endItem,
    required this.itemsPerPage,
    required this.currentPage,
    required this.lastPage,
    required this.path,
  });

  @JsonKey(name: 'total')
  final int totalItems;

  @JsonKey(name: 'from')
  final int? startItem;

  @JsonKey(name: 'to')
  final int? endItem;

  @JsonKey(name: 'per_page')
  final int itemsPerPage;

  final int currentPage;
  final int lastPage;
  final String path;

  @override
  List<Object?> get props => [
        totalItems,
        startItem,
        endItem,
        itemsPerPage,
        currentPage,
        lastPage,
        path,
      ];

  bool get allPagesFetched => currentPage == lastPage;

  factory MetadataInfo.fromJson(Map<String, dynamic> json) =>
      _$MetadataInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataInfoToJson(this);
}
