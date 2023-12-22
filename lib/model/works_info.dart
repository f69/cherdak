import 'package:json_annotation/json_annotation.dart';

import 'metadata_info.dart';
import 'paged_data_info.dart';
import 'works_item.dart';

part 'works_info.g.dart';

@JsonSerializable()
class WorksInfo extends PagedDataInfo<WorksItem> {
  WorksInfo({
    required super.data,
    required super.meta,
  });

  factory WorksInfo.fromJson(Map<String, dynamic> json) =>
      _$WorksInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorksInfoToJson(this);
}
