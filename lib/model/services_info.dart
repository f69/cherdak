import 'package:json_annotation/json_annotation.dart';

import 'metadata_info.dart';
import 'paged_data_info.dart';
import 'service_info.dart';

part 'services_info.g.dart';

@JsonSerializable()
class ServicesInfo extends PagedDataInfo<ServiceInfo> {
  ServicesInfo({
    required super.data,
    required super.meta,
  });

  factory ServicesInfo.fromJson(Map<String, dynamic> json) =>
      _$ServicesInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesInfoToJson(this);
}
