import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/model/request_params.dart';

final langProvider = StateProvider<String>((ref) => 'ru');

enum HomeTab { main, gallery, services, authors, about }

final homeTabProvider = StateProvider<HomeTab>((ref) => HomeTab.main);

final internalFilterProvider = StateProvider((ref) => const RequestParams());

final appVersionProvider = FutureProvider<String>((ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
});
