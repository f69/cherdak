import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/model/users_info.dart';
import '/app/app_const.dart';
import '/model/country_info.dart';
import '/model/genre_info.dart';
import '/model/stats_info.dart';
import '/model/work_info.dart';
import '/model/works_info.dart';
import '/model/request_params.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '$siteBase/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('stats')
  Future<StatsInfo> getStats();

  @GET('countries')
  Future<CountryInfoResponse> getCountries();

  @POST('genres')
  Future<GenreInfoResponse> getGenres(@Body() RequestParams request);

  @POST('works')
  Future<WorksInfo> getWorks(
      @Query('page') int page, @Body() RequestParams request);

  @GET('work/{slug}')
  Future<WorkInfoResponse> getWork(@Path('slug') String slug);

  @POST('authors')
  Future<UsersInfo> getAuthors(
      @Query('page') int page, @Body() RequestParams request);
}
