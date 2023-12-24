import 'package:hooks_riverpod/hooks_riverpod.dart';

final langProvider = StateProvider<String>((ref) => 'ru');

final mainMenuProvider = StateProvider<int>((ref) => 0);
