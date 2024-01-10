import 'package:cherdak/model/request_params.dart';
import 'package:cherdak/model/stats_info.dart';
import 'package:cherdak/model/works_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock_data.dart';
import '../mocks/mocks.dart';
import '../tools/utils.dart';

void main() {
  group('Mock API client', () {
    final client = MockApiClient();

    test('returns stats', () async {
      when(() => client.getStats())
          .thenAnswer((_) async => StatsInfo(users: 1, works: 1));
      final stats = await client.getStats();
      printJson(stats);
    });

    test('returns works', () async {
      when(() => client.getWorks(1, const RequestParams())).thenAnswer(
          (_) async => const WorksInfo(data: [], meta: emptyMetadata));
      final result = await client.getWorks(1, const RequestParams());
      printJson(result);
    });
  });
}
