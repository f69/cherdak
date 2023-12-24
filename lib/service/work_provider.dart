import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/model/work_info.dart';
import 'api_providers.dart';

part 'work_provider.g.dart';

@riverpod
Future<WorkInfo> work(WorkRef ref, String slug) async {
  final client = ref.watch(apiClientProvider);
  final result = await client.getWork(slug);
  return result.data;
}
