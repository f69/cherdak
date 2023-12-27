// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersHash() => r'3e882b8d9c34a7666462202284fb2da8172130d7';

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

abstract class _$Users extends BuildlessAutoDisposeAsyncNotifier<UsersInfo> {
  late final RequestParams? filter;

  FutureOr<UsersInfo> build({
    RequestParams? filter,
  });
}

/// See also [Users].
@ProviderFor(Users)
const usersProvider = UsersFamily();

/// See also [Users].
class UsersFamily extends Family<AsyncValue<UsersInfo>> {
  /// See also [Users].
  const UsersFamily();

  /// See also [Users].
  UsersProvider call({
    RequestParams? filter,
  }) {
    return UsersProvider(
      filter: filter,
    );
  }

  @override
  UsersProvider getProviderOverride(
    covariant UsersProvider provider,
  ) {
    return call(
      filter: provider.filter,
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
  String? get name => r'usersProvider';
}

/// See also [Users].
class UsersProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Users, UsersInfo> {
  /// See also [Users].
  UsersProvider({
    RequestParams? filter,
  }) : this._internal(
          () => Users()..filter = filter,
          from: usersProvider,
          name: r'usersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$usersHash,
          dependencies: UsersFamily._dependencies,
          allTransitiveDependencies: UsersFamily._allTransitiveDependencies,
          filter: filter,
        );

  UsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final RequestParams? filter;

  @override
  FutureOr<UsersInfo> runNotifierBuild(
    covariant Users notifier,
  ) {
    return notifier.build(
      filter: filter,
    );
  }

  @override
  Override overrideWith(Users Function() create) {
    return ProviderOverride(
      origin: this,
      override: UsersProvider._internal(
        () => create()..filter = filter,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Users, UsersInfo> createElement() {
    return _UsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UsersProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UsersRef on AutoDisposeAsyncNotifierProviderRef<UsersInfo> {
  /// The parameter `filter` of this provider.
  RequestParams? get filter;
}

class _UsersProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Users, UsersInfo>
    with UsersRef {
  _UsersProviderElement(super.provider);

  @override
  RequestParams? get filter => (origin as UsersProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
