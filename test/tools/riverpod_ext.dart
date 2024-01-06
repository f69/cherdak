import 'package:cherdak/service/common_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AppProviderContainerExt on ProviderContainer {
  void setHomeTab(HomeTab tab) => read(homeTabProvider.notifier).state = tab;
}
