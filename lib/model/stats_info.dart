import 'package:json_annotation/json_annotation.dart';

part 'stats_info.g.dart';

@JsonSerializable()
class StatsInfo {
  final int users;
  final int works;

  StatsInfo({
    required this.users,
    required this.works,
  });

  factory StatsInfo.fromJson(Map<String, dynamic> json) =>
      _$StatsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StatsInfoToJson(this);
}
