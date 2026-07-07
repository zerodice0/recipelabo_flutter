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

## Image Policy

- Step image payloads are restored into the app image storage directory.
- Restored step rows have `imageUrl` rewritten to the newly restored local file path.
- If a step references an image path but the backup does not contain an image payload, the original `imageUrl` value is preserved.
- Cooking log images remain inline in the cooking log row and do not create extra image files.
