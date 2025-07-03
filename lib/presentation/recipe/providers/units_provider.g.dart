// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableUnitsHash() => r'970da08a7e0497ee405e765989ba5fd1d3d8f832';

/// 사용 가능한 단위 목록을 제공하는 Provider
///
/// Copied from [AvailableUnits].
@ProviderFor(AvailableUnits)
final availableUnitsProvider = AutoDisposeAsyncNotifierProvider<AvailableUnits,
    List<IngredientMasterEntity>>.internal(
  AvailableUnits.new,
  name: r'availableUnitsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableUnitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableUnits
    = AutoDisposeAsyncNotifier<List<IngredientMasterEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
