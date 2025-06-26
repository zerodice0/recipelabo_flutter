import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// 사용자 정보 모델
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    String? avatarUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}

/// UserModel을 위한 SQLite 매핑 확장
extension UserModelExtension on UserModel {
  /// SQLite 데이터베이스용 Map으로 변환
  /// boolean 값은 정수로, DateTime은 ISO8601 문자열로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'avatarUrl': avatarUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isDeleted': isDeleted ? 1 : 0,
    };
  }

  /// SQLite 데이터베이스의 Map에서 객체 생성
  /// 정수를 boolean으로, 문자열을 DateTime으로 변환
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      username: map['username'] as String,
      avatarUrl: map['avatarUrl'] as String?,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      isDeleted: (map['isDeleted'] as int) == 1,
    );
  }
}
