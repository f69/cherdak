import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/model/works_info.dart';
import '/model/works_request.dart';
import 'api_providers.dart';
import 'paged_data_provider.dart';

class WorksProvider extends PagedDataProvider<WorksInfo> {
  @override
  Future<WorksInfo> getPage(int pageNumber) async {
    final client = ref.watch(apiClientProvider);
    final request = WorksRequest();
    final result = await client.getWorks(pageNumber, request);
    return result;
  }
}

final worksProvider =
    AutoDisposeAsyncNotifierProvider<WorksProvider, WorksInfo>(
        WorksProvider.new);
