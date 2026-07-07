# Local User Policy

## Current Local-Only Identity

- Records created before account support use `LocalUserPolicy.localUserId`.
- The stable local id is `local-device-user`.
- Synthetic local user rows created for backup/import use `Local Device User` as the display name.
- Synthetic rows for non-local imported author ids use `Imported User` so imported provenance is not labeled as the local device user.
- Legacy local ids such as `user-1` and `default_user` are treated as local-only records during future migrations, but existing imported data keeps its original `authorId`.

## Recipe Visibility

- New recipes are private by default: `isPublic = false`.
- The SQLite `recipes.isPublic` default is `0`.
- Database migration v22 reinterprets recipes owned by `local-device-user`, `user-1`, or `default_user` as private, because previous public values for local records came from the old app default rather than an explicit sharing workflow.
- Recipes with other imported author ids keep their existing `isPublic` value.

## Future Account Migration

- When account support is added, local records with `authorId == local-device-user` should be offered for claim or migration into the signed-in account.
- Legacy local ids in `LocalUserPolicy.legacyLocalUserIds` should follow the same migration path.
- Backup import/export preserves original author ids to avoid rewriting another device's data without an explicit account-linking flow.
- Public sharing should require an explicit user action after account support exists; local-only recipe creation must not imply public publishing.
