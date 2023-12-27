import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/model/request_params.dart';
import '/model/work_info.dart';
import '/model/works_info.dart';
import 'api_providers.dart';
import 'paged_data_notifier.dart';
import 'paged_fetcher.dart';

part 'work_providers.g.dart';

class WorksNotifier extends PagedDataNotifier<WorksInfo> {
  @override
  PageFetchFunction<WorksInfo>? get fetcher =>
      ref.watch(apiClientProvider).getWorks;
}

final worksProvider = AsyncNotifierProvider.autoDispose
    .family<WorksNotifier, WorksInfo, RequestParams?>(WorksNotifier.new);

final worksFilterProvider = StateProvider((ref) => const RequestParams());

@riverpod
Future<WorkInfo> work(WorkRef ref, String slug) async {
  final client = ref.watch(apiClientProvider);
  final result = await client.getWork(slug);
  return result.data;
}
