import 'package:cherdak/model/metadata_info.dart';

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
