import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/app_const.dart';
import '/model/country_info.dart';
import '/model/genre_info.dart';
import '/model/stats_info.dart';
import '/model/work_info.dart';
import '/model/works_info.dart';
import '/model/works_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '$siteBase/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('stats')
  Future<StatsInfo> getStats();

  @GET('countries')
  Future<CountryInfoResponse> getCountries();

  @POST('genres')
  Future<GenreInfoResponse> getGenres(@Body() WorksRequest request);

  @POST('works')
  Future<WorksInfo> getWorks(
      @Query('page') int page, @Body() WorksRequest request);

  @GET('work/{slug}')
  Future<WorkInfoResponse> getWork(@Path('slug') String slug);
}
