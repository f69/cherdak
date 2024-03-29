// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countriesHash() => r'71238530a7a35fb211c58dd29b2e66b35ed65809';

/// See also [countries].
@ProviderFor(countries)
final countriesProvider = FutureProvider<List<CountryInfo>>.internal(
  countries,
  name: r'countriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountriesRef = FutureProviderRef<List<CountryInfo>>;
String _$genresHash() => r'9af30d88a622984e4b0010c535a5073c5e79c614';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [genres].
@ProviderFor(genres)
const genresProvider = GenresFamily();

/// See also [genres].
class GenresFamily extends Family<AsyncValue<List<GenreInfo>>> {
  /// See also [genres].
  const GenresFamily();

  /// See also [genres].
  GenresProvider call(
    int categoryId,
  ) {
    return GenresProvider(
      categoryId,
    );
  }

  @override
  GenresProvider getProviderOverride(
    covariant GenresProvider provider,
  ) {
    return call(
      provider.categoryId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'genresProvider';
}

/// See also [genres].
class GenresProvider extends FutureProvider<List<GenreInfo>> {
  /// See also [genres].
  GenresProvider(
    int categoryId,
  ) : this._internal(
          (ref) => genres(
            ref as GenresRef,
            categoryId,
          ),
          from: genresProvider,
          name: r'genresProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$genresHash,
          dependencies: GenresFamily._dependencies,
          allTransitiveDependencies: GenresFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  GenresProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int categoryId;

  @override
  Override overrideWith(
    FutureOr<List<GenreInfo>> Function(GenresRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenresProvider._internal(
        (ref) => create(ref as GenresRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  FutureProviderElement<List<GenreInfo>> createElement() {
    return _GenresProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenresProvider && other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GenresRef on FutureProviderRef<List<GenreInfo>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _GenresProviderElement extends FutureProviderElement<List<GenreInfo>>
    with GenresRef {
  _GenresProviderElement(super.provider);

  @override
  int get categoryId => (origin as GenresProvider).categoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
