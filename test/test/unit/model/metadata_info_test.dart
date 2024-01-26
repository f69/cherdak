import 'package:cherdak/model/metadata_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mock_json.dart';
import '../../../tools/utils.dart';

void main() {
  group('MetadataInfo', () {
    test('is constructed from JSON', () {
      final data = MetadataInfo.fromJson(mockMetadataJson);
      expect(data.totalItems, equals(mockMetadataJson['total']));
    });

    test('produces the same JSON', () {
      final data = MetadataInfo.fromJson(mockMetadataJson);
      final json = data.toJson();
      expect(mapsEqual(json, mockMetadataJson), isTrue);
    });

    test('indicates if all pages are fetched', () {
      final data = MetadataInfo.fromJson(mockMetadataJson);
      expect(
          data.allPagesFetched,
          equals(mockMetadataJson['current_page'] ==
              mockMetadataJson['last_page']));
    });

    test('has props for equity', () {
      final data = MetadataInfo.fromJson(mockMetadataJson);
      expect(data.props, isNotEmpty);
    });
  });
}
