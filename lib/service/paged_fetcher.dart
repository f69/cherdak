import 'dart:async';

import '/model/paged_data_info.dart';
import '/model/request_params.dart';

typedef PageFetchFunction<T> = Future<T> Function(
    int pageNumber, RequestParams params);

mixin PagedFetcher<T extends PagedDataInfo> {
  Completer<T>? _completer;
  PageFetchFunction<T>? fetcher;
  RequestParams? requestParams;

  Future<T> fetchPage(int pageNumber);

  Future<T> getPage(int pageNumber) async {
    var completer = _completer;
    if (completer != null && !completer.isCompleted) {
      return completer.future;
    }

    completer = Completer<T>();
    _completer = completer;

    final result = (fetcher != null && requestParams != null)
        ? await fetcher!.call(pageNumber, requestParams!)
        : await fetchPage(pageNumber);

    completer.complete(result);
    return completer.future;
  }
}
