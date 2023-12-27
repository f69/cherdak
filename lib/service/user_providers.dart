import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/model/request_params.dart';
import '/model/users_info.dart';
import 'api_providers.dart';
import 'paged_data_notifier.dart';
import 'paged_fetcher.dart';

// part 'user_providers.g.dart';

// @riverpod
// class Users extends _$Users with PagedFetcher<UsersInfo> {
//   @override
//   FutureOr<UsersInfo> build({RequestParams? filter}) async {
//     // final client = ref.watch(apiClientProvider);
//     // fetcher = client.getAuthors;
//     requestParams = filter ?? const RequestParams();
//
//     return await getPage(1);
//   }
//
//   @override
//   PageFetchFunction<UsersInfo>? get fetcher =>
//       ref.watch(apiClientProvider).getAuthors;
//
//   Future<UsersInfo?> getNextPage() async {
//     final oldValue = state.value;
//     if (oldValue?.allPagesFetched ?? false) {
//       return state.value;
//     }
//
//     final pageNumber = (oldValue?.meta.currentPage ?? 0) + 1;
//     final page = await getPage(pageNumber);
//     state = AsyncData(UsersInfo(
//       data: [...(oldValue?.data ?? []), ...page.data],
//       meta: page.meta,
//     ));
//     return page;
//   }
// }

// class TestNotifier
//     extends AutoDisposeFamilyAsyncNotifier<UsersInfo?, RequestParams?> {
//   @override
//   FutureOr<UsersInfo?> build(RequestParams? arg) async {
//     return null;
//   }
// }

class UsersNotifier extends PagedDataNotifier<UsersInfo> {
  @override
  PageFetchFunction<UsersInfo>? get fetcher =>
      ref.watch(apiClientProvider).getAuthors;
}

final usersProvider = AsyncNotifierProvider.autoDispose
    .family<UsersNotifier, UsersInfo, RequestParams?>(UsersNotifier.new);

final usersFilterProvider = StateProvider((ref) => const RequestParams());
