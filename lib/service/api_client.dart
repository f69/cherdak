import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/app_const.dart';
import '/model/stats_info.dart';
import '/model/works_info.dart';
import '/model/works_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '$siteBase/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('stats')
  Future<StatsInfo> getStats();

  @POST('works')
  Future<WorksInfo> getWorks(
      @Query('page') int page, @Body() WorksRequest request);
}
