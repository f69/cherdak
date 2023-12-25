import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/paged_data_info.dart';
import '/model/works_info.dart';
import '/model/works_request.dart';
import 'api_providers.dart';

part 'works_provider.g.dart';

@riverpod
class Works extends _$Works {
  late WorksRequest _request;
  Completer<WorksInfo>? _completer;

  @override
  FutureOr<WorksInfo> build({WorksRequest? request}) async {
    _request = request ?? const WorksRequest();
    return await getPage(1);
  }

  Future<WorksInfo> getPage(int pageNumber) async {
    var completer = _completer;
    if (completer != null && !completer.isCompleted) {
      return completer.future;
    }

    completer = Completer<WorksInfo>();
    _completer = completer;

    final client = ref.watch(apiClientProvider);
    final result = await client.getWorks(pageNumber, _request);
    // await Future.delayed(const Duration(seconds: 2));

    completer.complete(result);
    return completer.future;
  }

  Future<WorksInfo?> getNextPage() async {
    final oldValue = state.value;
    if (oldValue?.allPagesFetched ?? false) {
      return state.value;
    }

    final pageNumber = (oldValue?.meta.currentPage ?? 0) + 1;
    final page = await getPage(pageNumber);
    state = AsyncData(WorksInfo(
      data: [...(oldValue?.data ?? []), ...page.data],
      meta: page.meta,
    ));
    return page;
  }
}

final worksFilterProvider = StateProvider((ref) => const WorksRequest());

// @riverpod
// Future<WorksInfo> galleryWorks(GalleryWorksRef ref) async {
//   final filter = ref.watch(worksFilterProvider);
//   // final worksAsync = ref.watch(worksProvider(request: filter));
//   // return worksAsync.value!;
//   return ref.watch(worksProvider(request: filter).future);
// }

mixin PagedFetcher<T extends PagedDataInfo> {
  Completer<T>? _completer;

  Future<T> fetchPage(int pageNumber);

  Future<T> getPage(int pageNumber) async {
    var completer = _completer;
    if (completer != null && !completer.isCompleted) {
      return completer.future;
    }

    completer = Completer<T>();
    _completer = completer;

    final result = await fetchPage(pageNumber);

    completer.complete(result);
    return completer.future;
  }
}
