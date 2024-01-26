// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'work_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workHash() => r'ad469812655c161f00e44e00786e75244c1544ca';

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

/// See also [work].
@ProviderFor(work)
const workProvider = WorkFamily();

/// See also [work].
class WorkFamily extends Family<AsyncValue<WorkInfo>> {
  /// See also [work].
  const WorkFamily();

  /// See also [work].
  WorkProvider call(
    String slug,
  ) {
    return WorkProvider(
      slug,
    );
  }

  @override
  WorkProvider getProviderOverride(
    covariant WorkProvider provider,
  ) {
    return call(
      provider.slug,
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
  String? get name => r'workProvider';
}

/// See also [work].
class WorkProvider extends AutoDisposeFutureProvider<WorkInfo> {
  /// See also [work].
  WorkProvider(
    String slug,
  ) : this._internal(
          (ref) => work(
            ref as WorkRef,
            slug,
          ),
          from: workProvider,
          name: r'workProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$workHash,
          dependencies: WorkFamily._dependencies,
          allTransitiveDependencies: WorkFamily._allTransitiveDependencies,
          slug: slug,
        );

  WorkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  Override overrideWith(
    FutureOr<WorkInfo> Function(WorkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkProvider._internal(
        (ref) => create(ref as WorkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WorkInfo> createElement() {
    return _WorkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorkRef on AutoDisposeFutureProviderRef<WorkInfo> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _WorkProviderElement extends AutoDisposeFutureProviderElement<WorkInfo>
    with WorkRef {
  _WorkProviderElement(super.provider);

  @override
  String get slug => (origin as WorkProvider).slug;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
