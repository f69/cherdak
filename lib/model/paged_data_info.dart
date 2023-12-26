import 'metadata_info.dart';

abstract class PagedDataInfo<T> {
  PagedDataInfo({
    required this.data,
    required this.meta,
  });

  final List<T> data;
  final MetadataInfo meta;

  bool get allPagesFetched => meta.currentPage == meta.lastPage;

  int get listItemCount => data.length + (allPagesFetched ? 0 : 1);
}
