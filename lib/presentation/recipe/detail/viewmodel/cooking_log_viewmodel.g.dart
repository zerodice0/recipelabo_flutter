// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_log_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cookingLogViewModelHash() =>
    r'10476a702ab47a2208869adf8da29c964d4db356';

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

/// See also [cookingLogViewModel].
@ProviderFor(cookingLogViewModel)
const cookingLogViewModelProvider = CookingLogViewModelFamily();

/// See also [cookingLogViewModel].
class CookingLogViewModelFamily
    extends Family<AsyncValue<List<CookingLogEntity>>> {
  /// See also [cookingLogViewModel].
  const CookingLogViewModelFamily();

  /// See also [cookingLogViewModel].
  CookingLogViewModelProvider call(String recipeVersionId) {
    return CookingLogViewModelProvider(recipeVersionId);
  }

  @override
  CookingLogViewModelProvider getProviderOverride(
    covariant CookingLogViewModelProvider provider,
  ) {
    return call(provider.recipeVersionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cookingLogViewModelProvider';
}

/// See also [cookingLogViewModel].
class CookingLogViewModelProvider
    extends AutoDisposeFutureProvider<List<CookingLogEntity>> {
  /// See also [cookingLogViewModel].
  CookingLogViewModelProvider(String recipeVersionId)
    : this._internal(
        (ref) =>
            cookingLogViewModel(ref as CookingLogViewModelRef, recipeVersionId),
        from: cookingLogViewModelProvider,
        name: r'cookingLogViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$cookingLogViewModelHash,
        dependencies: CookingLogViewModelFamily._dependencies,
        allTransitiveDependencies:
            CookingLogViewModelFamily._allTransitiveDependencies,
        recipeVersionId: recipeVersionId,
      );

  CookingLogViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeVersionId,
  }) : super.internal();

  final String recipeVersionId;

  @override
  Override overrideWith(
    FutureOr<List<CookingLogEntity>> Function(CookingLogViewModelRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CookingLogViewModelProvider._internal(
        (ref) => create(ref as CookingLogViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeVersionId: recipeVersionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CookingLogEntity>> createElement() {
    return _CookingLogViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CookingLogViewModelProvider &&
        other.recipeVersionId == recipeVersionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeVersionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CookingLogViewModelRef
    on AutoDisposeFutureProviderRef<List<CookingLogEntity>> {
  /// The parameter `recipeVersionId` of this provider.
  String get recipeVersionId;
}

class _CookingLogViewModelProviderElement
    extends AutoDisposeFutureProviderElement<List<CookingLogEntity>>
    with CookingLogViewModelRef {
  _CookingLogViewModelProviderElement(super.provider);

  @override
  String get recipeVersionId =>
      (origin as CookingLogViewModelProvider).recipeVersionId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
