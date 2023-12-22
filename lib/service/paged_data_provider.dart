import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class PagedDataProvider<T> extends AutoDisposeAsyncNotifier<T> {
  @override
  FutureOr<T> build() => getPage(1);

  FutureOr<T> getPage(int pageNumber);
}
