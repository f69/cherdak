import 'package:cherdak/model/category.dart';
import 'package:cherdak/model/genre.dart';
import 'package:cherdak/model/metadata_info.dart';
import 'package:cherdak/model/service.dart';
import 'package:cherdak/model/service_info.dart';
import 'package:cherdak/model/user_info.dart';
import 'package:cherdak/model/user_short_info.dart';
import 'package:cherdak/model/work_info.dart';
import 'package:cherdak/model/work_short_info.dart';
import 'package:cherdak/model/works_item.dart';

final emptyMetadata = MetadataInfo(
    totalItems: 0,
    startItem: null,
    endItem: null,
    itemsPerPage: 1,
    currentPage: 0,
    lastPage: 0,
    path: '');

MetadataInfo simpleMetadata(int count) => MetadataInfo(
    totalItems: count,
    startItem: 1,
    endItem: count,
    itemsPerPage: count + 1,
    currentPage: 1,
    lastPage: 1,
    path: '');

final mockCategory = Category.fromJson({
  "id": 1,
  "title": "Живопись",
  "title_en": "Painting",
  "slug": "painting",
});

final mockGenre = Genre.fromJson({
  "id": 45,
  "title": "Абстракция",
  "title_en": "Abstraction",
  "slug": "abstraction",
});

const mockUser = UserInfo(
  id: 1,
  slug: 'user1',
  name: 'User Name',
);

final mockShortUserInfo = UserShortInfo.fromJson({
  "id": 1,
  "name": "User Name",
  "slug": "user1",
  "image": "",
  "rate": 9.5,
});

final mockWork = WorkInfo(
  id: 1,
  title: 'Work1',
  country: 'Беларусь',
  countryId: 1,
  slug: 'work1',
  technique: 'Живопись',
  description: 'Тестовая работа',
  status: 2,
  price: 0,
  currency: 0,
  adult: 0,
  image: '',
  likesCount: 2,
  viewsCount: 3,
  category: mockCategory,
  genre: mockGenre,
  user: mockShortUserInfo,
  liked: false,
);

final mockWorkShortInfo = WorkShortInfo(
  id: 1,
  title: 'Work1',
  slug: 'work1',
  forSale: true,
  createdAt: '',
  mainImage: '',
  likesCount: 2,
);

final mockWorksItem = WorksItem(
  work: mockWorkShortInfo,
  liked: false,
  user: mockShortUserInfo,
  category: mockCategory,
  genre: mockGenre,
);

const mockService = ServiceInfo(
  slug: 'service1',
  name: 'user1',
  rate: 8,
  place: 'Беларусь',
  services: [
    Service(
      title: 'service',
      slug: 'service',
    )
  ],
);
