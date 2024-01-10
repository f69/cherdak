import 'package:equatable/equatable.dart';

import 'metadata_info.dart';

class PagedDataInfo<T> extends Equatable {
  const PagedDataInfo({
    required this.data,
    required this.meta,
  });

  final List<T> data;
  final MetadataInfo meta;

  @override
  List<Object?> get props => [
        data,
        meta,
      ];

  bool get allPagesFetched => meta.currentPage == meta.lastPage;

  int get listItemCount => data.length + (allPagesFetched ? 0 : 1);
}
