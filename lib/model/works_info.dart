import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata_info.dart';
import 'paged_data_info.dart';
import 'works_item.dart';

part 'works_info.g.dart';

@CopyWith()
@JsonSerializable()
class WorksInfo extends PagedDataInfo<WorksItem> {
  const WorksInfo({
    required super.data,
    required super.meta,
  });

  factory WorksInfo.fromJson(Map<String, dynamic> json) =>
      _$WorksInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorksInfoToJson(this);
}
