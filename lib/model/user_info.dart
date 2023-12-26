import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  UserInfo({
    required this.id,
    required this.slug,
    required this.name,
    this.selected,
    this.countryId,
    this.country,
    this.countryEn,
    this.city,
    this.image,
    this.shortDescription,
    this.phone,
    this.email,
    this.about,
    this.vk,
    this.fb,
    this.insta,
    this.twitter,
    this.site,
    this.behance,
    this.dribbble,
    this.rate,
  });

  final int id;
  final String slug;
  final String name;
  final int? selected;
  final int? countryId;
  final String? country;
  final String? countryEn;
  final String? city;
  final String? image;
  final String? shortDescription;
  final String? phone;
  final String? email;
  final String? about;
  final String? vk;
  final String? fb;
  final String? insta;
  final String? twitter;
  final String? site;
  final String? behance;
  final String? dribbble;
  final int? rate;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  String get place => '${city != null ? "$city, " : ""}${country ?? ""}';
}
