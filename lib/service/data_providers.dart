import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/model/country_info.dart';
import '/model/genre_info.dart';
import '/model/request_params.dart';
import 'api_providers.dart';

part 'data_providers.g.dart';

@Riverpod(keepAlive: true)
Future<List<CountryInfo>> countries(CountriesRef ref) async {
  final client = ref.watch(apiClientProvider);
  final result = await client.getCountries();
  return result.data;
}

@Riverpod(keepAlive: true)
Future<List<GenreInfo>> genres(GenresRef ref, int categoryId) async {
  final client = ref.watch(apiClientProvider);
  final result = await client.getGenres(RequestParams(categoryId: categoryId));
  return result.data;
}
