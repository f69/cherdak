import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/model/country_info.dart';
import '/model/genre_info.dart';
import '/model/works_request.dart';
import 'api_providers.dart';

part 'data_providers.g.dart';

@riverpod
Future<List<CountryInfo>> countries(CountriesRef ref) async {
  final client = ref.watch(apiClientProvider);
  final result = await client.getCountries();
  return result.data;
}

@riverpod
Future<List<GenreInfo>> genres(GenresRef ref, int categoryId) async {
  final client = ref.watch(apiClientProvider);
  final result = await client.getGenres(WorksRequest(categoryId: categoryId));
  return result.data;
}
