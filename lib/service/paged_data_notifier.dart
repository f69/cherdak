import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/model/paged_data_info.dart';
import '/model/request_params.dart';
import '/service/paged_fetcher.dart';

abstract class PagedDataNotifier<T extends PagedDataInfo>
    extends AutoDisposeFamilyAsyncNotifier<T, RequestParams?>
    with PagedFetcher<T> {
  @override
  FutureOr<T> build(RequestParams? arg) async {
    requestParams = arg ?? const RequestParams();
    return await getPage(1);
  }

  Future<T?> getNextPage() async {
    final oldValue = state.value;
    if (oldValue?.allPagesFetched ?? false) {
      return state.value;
    }

    final pageNumber = (oldValue?.meta.currentPage ?? 0) + 1;
    try {
      final page = await getPage(pageNumber);
      page.data.insertAll(0, oldValue?.data ?? []);
      state = AsyncData(page);
      return page;
    } catch (error, stack) {
      state = AsyncError(error, stack);
      return oldValue;
    }
  }
}
