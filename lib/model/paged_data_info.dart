import 'package:cherdak/model/metadata_info.dart';

abstract class PagedDataInfo<T> {
  final List<T> data;
  final MetadataInfo meta;

  PagedDataInfo({
    required this.data,
    required this.meta,
  });
}
