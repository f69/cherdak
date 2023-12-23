import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

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
