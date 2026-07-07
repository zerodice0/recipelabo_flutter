class LocalUserPolicy {
  const LocalUserPolicy._();

  static const String localUserId = 'local-device-user';
  static const String localUsername = 'Local Device User';
  static const bool defaultRecipeIsPublic = false;

  static const Set<String> legacyLocalUserIds = {'user-1', 'default_user'};

  static bool isLegacyLocalUserId(String userId) {
    return legacyLocalUserIds.contains(userId);
  }
}
