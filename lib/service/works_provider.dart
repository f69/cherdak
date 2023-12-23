import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/model/works_info.dart';
import '/model/works_request.dart';
import 'api_providers.dart';

part 'works_provider.g.dart';

@riverpod
class Works extends _$Works {
  late WorksRequest _request;

  @override
  FutureOr<WorksInfo> build({WorksRequest? request}) async {
    _request = request ?? const WorksRequest();
    return await getPage(1);
  }

  Future<WorksInfo> getPage(int pageNumber) async {
    final client = ref.watch(apiClientProvider);
    final result = await client.getWorks(pageNumber, _request);
    return result;
  }
}
