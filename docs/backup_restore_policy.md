# Recipe Backup and Restore Policy

## Format

- Backup files are JSON documents with `format: recipick.recipe_backup`.
- `formatVersion` is currently `1`.
- The backup includes these tables: `users`, `recipes`, `recipe_versions`, `ingredients`, `steps`, and `cooking_logs`.
- Cooking log images are preserved through `cooking_logs.base64EncodedImageData`.
- Step image files referenced by `steps.imageUrl` are embedded under `stepImages` when the local file exists.

## Merge Policy

- Restore uses upsert-by-id.
- If an imported row has the same primary key as an existing row, the imported row replaces the existing row.
- Existing rows that are not present in the backup are preserved.
- Unknown future columns in the backup are ignored during restore.
- Invalid backup format or unsupported `formatVersion` fails before any database write.
- Restore validates required columns, numeric fields, and recipe/version/log relationships before any database write.
- Missing local user rows for referenced recipe/log authors are synthesized during restore to avoid orphan author references in legacy local data.

## Image Policy

- Step image payloads are restored into the app image storage directory.
- Restored step rows have `imageUrl` rewritten to the newly restored local file path.
- If a duplicate local step already has an image and the backup image payload is missing or invalid, the existing local `imageUrl` is preserved.
- If a step references an image path but no image payload can be restored and there is no existing local image path for the step, `imageUrl` is restored as `null` to avoid stale device-local file paths.
- If database restore fails after image payloads are written, those newly restored image files are deleted before the error is returned.
- Cooking log images remain inline in the cooking log row and do not create extra image files.
