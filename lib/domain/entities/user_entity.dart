import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// 사용자 정보 엔티티
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String username,
    String? avatarUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserEntity;
}
