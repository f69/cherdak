import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/model/services_info.dart';
import '/model/request_params.dart';
import 'api_providers.dart';
import 'paged_data_notifier.dart';
import 'paged_fetcher.dart';

class ServicesNotifier extends PagedDataNotifier<ServicesInfo> {
  @override
  PageFetchFunction<ServicesInfo>? get fetcher =>
      ref.watch(apiClientProvider).getServices;
}

final servicesProvider = AsyncNotifierProvider.autoDispose
    .family<ServicesNotifier, ServicesInfo, RequestParams?>(
        ServicesNotifier.new);

final servicesFilterProvider = StateProvider((ref) => const RequestParams());
