// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'works_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$worksHash() => r'ad976c693a9b3735d94df8cbeec7c8edabf73a75';

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

abstract class _$Works extends BuildlessAutoDisposeAsyncNotifier<WorksInfo> {
  late final WorksRequest? request;

  FutureOr<WorksInfo> build({
    WorksRequest? request,
  });
}

/// See also [Works].
@ProviderFor(Works)
const worksProvider = WorksFamily();

/// See also [Works].
class WorksFamily extends Family<AsyncValue<WorksInfo>> {
  /// See also [Works].
  const WorksFamily();

  /// See also [Works].
  WorksProvider call({
    WorksRequest? request,
  }) {
    return WorksProvider(
      request: request,
    );
  }

  @override
  WorksProvider getProviderOverride(
    covariant WorksProvider provider,
  ) {
    return call(
      request: provider.request,
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
  String? get name => r'worksProvider';
}

/// See also [Works].
class WorksProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Works, WorksInfo> {
  /// See also [Works].
  WorksProvider({
    WorksRequest? request,
  }) : this._internal(
          () => Works()..request = request,
          from: worksProvider,
          name: r'worksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$worksHash,
          dependencies: WorksFamily._dependencies,
          allTransitiveDependencies: WorksFamily._allTransitiveDependencies,
          request: request,
        );

  WorksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final WorksRequest? request;

  @override
  FutureOr<WorksInfo> runNotifierBuild(
    covariant Works notifier,
  ) {
    return notifier.build(
      request: request,
    );
  }

  @override
  Override overrideWith(Works Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorksProvider._internal(
        () => create()..request = request,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Works, WorksInfo> createElement() {
    return _WorksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorksProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorksRef on AutoDisposeAsyncNotifierProviderRef<WorksInfo> {
  /// The parameter `request` of this provider.
  WorksRequest? get request;
}

class _WorksProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Works, WorksInfo>
    with WorksRef {
  _WorksProviderElement(super.provider);

  @override
  WorksRequest? get request => (origin as WorksProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
