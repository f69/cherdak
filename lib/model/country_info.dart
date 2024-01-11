import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '/ext/context_ext.dart';

part 'country_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryInfo {
  final int id;
  final String title;
  final String titleEng;
  final String titleBel;
  final String slug;

  CountryInfo({
    required this.id,
    required this.title,
    required this.titleEng,
    required this.titleBel,
    required this.slug,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);

  String getTitle(BuildContext context) => switch (context.lang) {
        'ru' => title,
        'be' => titleBel,
        _ => titleEng,
      };
}

@JsonSerializable()
class CountryInfoResponse {
  CountryInfoResponse({
    required this.data,
  });

  final List<CountryInfo> data;

  factory CountryInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInfoResponseToJson(this);
}
