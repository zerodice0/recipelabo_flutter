# Step Image Policy

## Storage

- Step photos are selected through `PickImageUseCase`.
- Selected photos are copied into the app image storage directory by `ImageStorageService`.
- `steps.imageUrl` stores the resulting local file path.
- Replacing or deleting a step photo clears the step reference in the edited recipe state.
- Edit actions do not immediately delete existing local image files, because saved versions and canceled edits may still reference the same path.
- Any future orphan cleanup must check persisted step references across recipes and versions before deleting a local image file.

## Display

- Recipe detail step cards render `steps.imageUrl` as an actual image.
- Local app image paths are rendered with file image loading.
- `http` and `https` image URLs are rendered as network images, which keeps imported remote step-image URLs inspectable before they are converted to local files.
- Broken or missing files render a broken-image placeholder instead of hiding the step.

## Backup

- JSON backup embeds local step image files referenced by `steps.imageUrl` when the file exists.
- Restore writes embedded step images back into app image storage and rewrites `steps.imageUrl` to the restored local path.
- If an embedded image cannot be restored, duplicate local steps keep their existing local image path and new steps restore with `imageUrl: null`.
