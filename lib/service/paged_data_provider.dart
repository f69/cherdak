import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class PagedDataProvider<T> extends AsyncNotifier<T> {
  @override
  FutureOr<T> build() async {
    init();
    return getPage(1);
  }

  void init();

  FutureOr<T> getPage(int pageNumber);
}
