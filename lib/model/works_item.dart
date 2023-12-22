import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'genre.dart';
import 'user_short_info.dart';
import 'work_short_info.dart';

part 'works_item.g.dart';

@JsonSerializable()
class WorksItem {
  final WorkShortInfo work;
  final UserShortInfo user;
  final Category category;
  final Genre genre;
  final bool liked;

  WorksItem({
    required this.work,
    required this.liked,
    required this.user,
    required this.category,
    required this.genre,
  });

  factory WorksItem.fromJson(Map<String, dynamic> json) =>
      _$WorksItemFromJson(json);

  Map<String, dynamic> toJson() => _$WorksItemToJson(this);
}
