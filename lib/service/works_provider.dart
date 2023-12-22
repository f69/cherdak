import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/model/works_info.dart';
import '/model/works_request.dart';
import 'api_providers.dart';
import 'paged_data_provider.dart';

class WorksProvider extends PagedDataProvider<WorksInfo> {
  var _request = WorksRequest();

  @override
  void init() {
    _request = ref.watch(worksRequestProvider);
  }

  @override
  Future<WorksInfo> getPage(int pageNumber) async {
    final client = ref.watch(apiClientProvider);
    final result = await client.getWorks(pageNumber, _request);
    return result;
  }
}

final worksProvider = AsyncNotifierProvider<WorksProvider, WorksInfo>(
  WorksProvider.new,
  dependencies: [worksRequestProvider],
);

final worksRequestProvider = Provider((ref) => WorksRequest());
