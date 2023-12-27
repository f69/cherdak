import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/model/request_params.dart';
import '/model/users_info.dart';
import 'api_providers.dart';
import 'paged_data_notifier.dart';
import 'paged_fetcher.dart';

class UsersNotifier extends PagedDataNotifier<UsersInfo> {
  @override
  PageFetchFunction<UsersInfo>? get fetcher =>
      ref.watch(apiClientProvider).getAuthors;
}

final usersProvider = AsyncNotifierProvider.autoDispose
    .family<UsersNotifier, UsersInfo, RequestParams?>(UsersNotifier.new);

final usersFilterProvider = StateProvider((ref) => const RequestParams());
