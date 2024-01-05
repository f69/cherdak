import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../fixtures/mock_path_provider.dart';

class _MyHttpOverrides extends HttpOverrides {}

void initGoldens() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = _MyHttpOverrides();
  PathProviderPlatform.instance = FakePathProviderPlatform();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}
