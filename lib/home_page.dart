import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'app_app_bar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: AppAppBar(
        leading: Icon(Icons.menu),
        title: Text(appTitle),
        actions: [Icon(CupertinoIcons.search, size: 18)],
      ),
    );
  }
}
