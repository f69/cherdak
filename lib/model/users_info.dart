import 'package:json_annotation/json_annotation.dart';

import 'metadata_info.dart';
import 'paged_data_info.dart';
import 'user_info.dart';

part 'users_info.g.dart';

@JsonSerializable()
class UsersInfo extends PagedDataInfo<UserInfo> {
  UsersInfo({
    required super.data,
    required super.meta,
  });

  factory UsersInfo.fromJson(Map<String, dynamic> json) =>
      _$UsersInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UsersInfoToJson(this);
}
