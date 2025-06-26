// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_edit_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeEditViewModelHash() =>
    r'de7f1d5cdd58fd3dd304eaa92ae330d3a8472359';

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

abstract class _$RecipeEditViewModel
    extends BuildlessAutoDisposeNotifier<RecipeEditState> {
  late final String? recipeId;

  RecipeEditState build(String? recipeId);
}

/// See also [RecipeEditViewModel].
@ProviderFor(RecipeEditViewModel)
const recipeEditViewModelProvider = RecipeEditViewModelFamily();

/// See also [RecipeEditViewModel].
class RecipeEditViewModelFamily extends Family<RecipeEditState> {
  /// See also [RecipeEditViewModel].
  const RecipeEditViewModelFamily();

  /// See also [RecipeEditViewModel].
  RecipeEditViewModelProvider call(String? recipeId) {
    return RecipeEditViewModelProvider(recipeId);
  }

  @override
  RecipeEditViewModelProvider getProviderOverride(
    covariant RecipeEditViewModelProvider provider,
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
  String? get name => r'recipeEditViewModelProvider';
}

/// See also [RecipeEditViewModel].
class RecipeEditViewModelProvider
    extends
        AutoDisposeNotifierProviderImpl<RecipeEditViewModel, RecipeEditState> {
  /// See also [RecipeEditViewModel].
  RecipeEditViewModelProvider(String? recipeId)
    : this._internal(
        () => RecipeEditViewModel()..recipeId = recipeId,
        from: recipeEditViewModelProvider,
        name: r'recipeEditViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$recipeEditViewModelHash,
        dependencies: RecipeEditViewModelFamily._dependencies,
        allTransitiveDependencies:
            RecipeEditViewModelFamily._allTransitiveDependencies,
        recipeId: recipeId,
      );

  RecipeEditViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final String? recipeId;

  @override
  RecipeEditState runNotifierBuild(covariant RecipeEditViewModel notifier) {
    return notifier.build(recipeId);
  }

  @override
  Override overrideWith(RecipeEditViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeEditViewModelProvider._internal(
        () => create()..recipeId = recipeId,
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
  AutoDisposeNotifierProviderElement<RecipeEditViewModel, RecipeEditState>
  createElement() {
    return _RecipeEditViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeEditViewModelProvider && other.recipeId == recipeId;
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
mixin RecipeEditViewModelRef
    on AutoDisposeNotifierProviderRef<RecipeEditState> {
  /// The parameter `recipeId` of this provider.
  String? get recipeId;
}

class _RecipeEditViewModelProviderElement
    extends
        AutoDisposeNotifierProviderElement<RecipeEditViewModel, RecipeEditState>
    with RecipeEditViewModelRef {
  _RecipeEditViewModelProviderElement(super.provider);

  @override
  String? get recipeId => (origin as RecipeEditViewModelProvider).recipeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
