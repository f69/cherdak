import 'package:hooks_riverpod/hooks_riverpod.dart';

final langProvider = StateProvider<String>((ref) => 'ru');

enum HomeTab { main, gallery, services, authors, about }

final homeTabProvider = StateProvider<HomeTab>((ref) => HomeTab.main);
