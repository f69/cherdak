import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'home_page.dart';

const appTitle = 'Cherdak Dalí';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: AppTheme.data,
      home: const HomePage(),
    );
  }
}
