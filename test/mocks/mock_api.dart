import 'package:cherdak/model/request_params.dart';
import 'package:cherdak/model/services_info.dart';
import 'package:cherdak/model/users_info.dart';
import 'package:cherdak/model/works_info.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';
import 'mocks.dart';

class FakeRequestParams extends Fake implements RequestParams {}

MockApiClient getMockApiClient() {
  registerFallbackValue(FakeRequestParams());
  final mockClient = MockApiClient();

  when(() => mockClient.getAuthors(1, any())).thenAnswer(
      (_) async => UsersInfo(data: const [mockUser], meta: simpleMetadata(1)));

  when(() => mockClient.getWorks(1, any())).thenAnswer(
      (_) async => WorksInfo(data: [mockWorksItem], meta: simpleMetadata(1)));

  when(() => mockClient.getServices(1, any())).thenAnswer(
      (_) async => ServicesInfo(data: const [mockService], meta: simpleMetadata(1)));

  return mockClient;
}
