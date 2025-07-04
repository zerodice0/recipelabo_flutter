// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeDetailViewModelHash() =>
    r'5c781ce80589c836fb43f14d4eac4fcc8cb3be25';

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

/// See also [recipeDetailViewModel].
@ProviderFor(recipeDetailViewModel)
const recipeDetailViewModelProvider = RecipeDetailViewModelFamily();

/// See also [recipeDetailViewModel].
class RecipeDetailViewModelFamily
    extends Family<AsyncValue<(RecipeEntity, List<RecipeVersionEntity>)>> {
  /// See also [recipeDetailViewModel].
  const RecipeDetailViewModelFamily();

  /// See also [recipeDetailViewModel].
  RecipeDetailViewModelProvider call(String recipeId) {
    return RecipeDetailViewModelProvider(recipeId);
  }

  @override
  RecipeDetailViewModelProvider getProviderOverride(
    covariant RecipeDetailViewModelProvider provider,
  ) {
    return call(provider.recipeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeDetailViewModelProvider';
}

/// See also [recipeDetailViewModel].
class RecipeDetailViewModelProvider
    extends
        AutoDisposeFutureProvider<(RecipeEntity, List<RecipeVersionEntity>)> {
  /// See also [recipeDetailViewModel].
  RecipeDetailViewModelProvider(String recipeId)
    : this._internal(
        (ref) =>
            recipeDetailViewModel(ref as RecipeDetailViewModelRef, recipeId),
        from: recipeDetailViewModelProvider,
        name: r'recipeDetailViewModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeDetailViewModelHash,
        dependencies: RecipeDetailViewModelFamily._dependencies,
        allTransitiveDependencies:
            RecipeDetailViewModelFamily._allTransitiveDependencies,
        recipeId: recipeId,
      );

  RecipeDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final String recipeId;

  @override
  Override overrideWith(
    FutureOr<(RecipeEntity, List<RecipeVersionEntity>)> Function(
      RecipeDetailViewModelRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeDetailViewModelProvider._internal(
        (ref) => create(ref as RecipeDetailViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<(RecipeEntity, List<RecipeVersionEntity>)>
  createElement() {
    return _RecipeDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDetailViewModelProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeDetailViewModelRef
    on AutoDisposeFutureProviderRef<(RecipeEntity, List<RecipeVersionEntity>)> {
  /// The parameter `recipeId` of this provider.
  String get recipeId;
}

class _RecipeDetailViewModelProviderElement
    extends
        AutoDisposeFutureProviderElement<
          (RecipeEntity, List<RecipeVersionEntity>)
        >
    with RecipeDetailViewModelRef {
  _RecipeDetailViewModelProviderElement(super.provider);

  @override
  String get recipeId => (origin as RecipeDetailViewModelProvider).recipeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
