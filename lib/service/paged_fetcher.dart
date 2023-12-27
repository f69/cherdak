import 'dart:async';

import 'package:flutter/foundation.dart';

import '/model/paged_data_info.dart';
import '/model/request_params.dart';

typedef PageFetchFunction<T> = Future<T> Function(
    int pageNumber, RequestParams params);

mixin PagedFetcher<T extends PagedDataInfo> {
  Completer<T>? _completer;

  RequestParams? requestParams;

  PageFetchFunction<T>? fetcher;

  Future<T> fetchPage(int pageNumber) {
    throw UnimplementedError();
  }

  Future<T> getPage(int pageNumber) async {
    var completer = _completer;
    if (completer != null && !completer.isCompleted) {
      return completer.future;
    }

    completer = Completer<T>();
    _completer = completer;

    try {
      final result = (fetcher != null && requestParams != null)
          ? await fetcher!.call(pageNumber, requestParams!)
          : await fetchPage(pageNumber);

      if (kDebugMode) {
        await Future.delayed(const Duration(seconds: 2));
      }

      completer.complete(result);
      return completer.future;
    } catch (error, stack) {
      completer.completeError(error, stack);
      rethrow;
    }
  }
}
