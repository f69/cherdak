import 'package:json_annotation/json_annotation.dart';

part 'metadata_info.g.dart';

@JsonSerializable()
class MetadataInfo {
  @JsonKey(name: 'total')
  final int totalItems;

  @JsonKey(name: 'from')
  final int startItem;

  @JsonKey(name: 'to')
  final int endItem;

  @JsonKey(name: 'per_page')
  final int itemsPerPage;

  final int currentPage;
  final int lastPage;
  final String path;

  MetadataInfo({
    required this.totalItems,
    required this.startItem,
    required this.endItem,
    required this.itemsPerPage,
    required this.currentPage,
    required this.lastPage,
    required this.path,
  });

  factory MetadataInfo.fromJson(Map<String, dynamic> json) =>
      _$MetadataInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataInfoToJson(this);
}
