import 'package:cherdak/model/category.dart';
import 'package:cherdak/model/genre.dart';
import 'package:cherdak/model/user_short_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_info.g.dart';

@JsonSerializable()
class WorkInfo {
  WorkInfo({
    required this.id,
    required this.title,
    required this.country,
    required this.countryId,
    required this.slug,
    this.author,
    this.creationDate,
    required this.technique,
    required this.description,
    required this.status,
    required this.price,
    required this.currency,
    required this.adult,
    this.isForSale,
    required this.image,
    required this.likesCount,
    required this.viewsCount,
    required this.category,
    required this.genre,
    required this.user,
    required this.liked,
  });

  final int id;
  final String title;
  final String country;
  final int countryId;
  final String slug;
  final String? author;
  final String? creationDate;
  final String? technique;
  final String description;
  final int status;
  final num price;
  final int currency;
  final int adult;
  final int? isForSale;
  final String image;
  final int likesCount;
  final int viewsCount;
  final Category category;
  final Genre genre;
  final UserShortInfo user;
  final bool liked;

  factory WorkInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkInfoToJson(this);
}

@JsonSerializable()
class WorkInfoResponse {
  WorkInfoResponse({
    required this.data,
  });

  final WorkInfo data;

  factory WorkInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkInfoResponseToJson(this);
}

/*
{
    "data": {
        "id": 13865,
        "title": "Лесная тропа",
        "country": "Беларусь",
        "country_id": 1,
        "slug": "lesnaya-tropa",
        "author": null,
        "creation_date": null,
        "technique": "Холст 25-35.Акрил",
        "description": "Прекрасная работа. Подарит покой и радость.",
        "status": 2,
        "price": 0,
        "currency": 0,
        "adult": 0,
        "is_for_sale": null,
        "image": "9WuGlCf39BoqSYN8QIL01kuTPssVfCaW.jpg",
        "likes_count": 1,
        "views_count": 13,
        "category": {
            "id": 1,
            "title": "Живопись",
            "title_en": "Painting",
            "slug": "painting"
        },
        "genre": {
            "id": 44,
            "title": "Пейзаж",
            "title_en": "Landscape",
            "slug": "landscape"
        },
        "user": {
            "id": 14412,
            "name": "Давыдова Дарья",
            "slug": "darya_davydova_14412",
            "image": "9guXKoNPoAlqdkcxWuuQ9KQBHLUMttMF.",
            "rate": null
        },
        "liked": false
    }
}
 */
