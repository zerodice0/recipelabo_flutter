// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableIngredientsHash() =>
    r'e42b2950c82523230cff5b4153b6eb79c1fa69ea';

/// 사용 가능한 재료 목록을 제공하는 Provider
///
/// Copied from [AvailableIngredients].
@ProviderFor(AvailableIngredients)
final availableIngredientsProvider = AutoDisposeAsyncNotifierProvider<
  AvailableIngredients,
  List<SeasoningEntity>
>.internal(
  AvailableIngredients.new,
  name: r'availableIngredientsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availableIngredientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableIngredients =
    AutoDisposeAsyncNotifier<List<SeasoningEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
