import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/model/paged_data_info.dart';
import '/model/works_info.dart';
import '/model/request_params.dart';
import 'api_providers.dart';

part 'works_provider.g.dart';

@riverpod
class Works extends _$Works {
  late RequestParams _request;
  Completer<WorksInfo>? _completer;

  @override
  FutureOr<WorksInfo> build({RequestParams? request}) async {
    _request = request ?? const RequestParams();
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

final worksFilterProvider = StateProvider((ref) => const RequestParams());
