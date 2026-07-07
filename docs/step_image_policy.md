# Step Image Policy

## Storage

- Step photos are selected through `PickImageUseCase`.
- Selected photos are copied into the app image storage directory by `ImageStorageService`.
- `steps.imageUrl` stores the resulting local file path.
- Replacing or deleting a step photo clears the step reference and attempts to remove the old local image file when no other edited step still references it.

## Display

- Recipe detail step cards render `steps.imageUrl` as an actual image.
- Local app image paths are rendered with file image loading.
- `http` and `https` image URLs are rendered as network images, which keeps imported remote step-image URLs inspectable before they are converted to local files.
- Broken or missing files render a broken-image placeholder instead of hiding the step.

## Backup

- JSON backup embeds local step image files referenced by `steps.imageUrl` when the file exists.
- Restore writes embedded step images back into app image storage and rewrites `steps.imageUrl` to the restored local path.
- If an embedded image cannot be restored, duplicate local steps keep their existing local image path and new steps restore with `imageUrl: null`.
