# Building MatzPhone

> Pre-alpha: the manifest currently pins upstream AOSP plus our vendor
> tree. Until Phase 1 lands a device tree, the build produces a GSI-style
> target, not a device image.

## Requirements

- Linux x86_64, 64 GB RAM recommended (32 GB minimum with zram)
- ~400 GB free SSD space
- `repo`, and the standard AOSP build dependencies for your distro

## Sync

```sh
mkdir matzphone && cd matzphone
repo init -u https://github.com/mmirman/matzphone -b main
repo sync -c -j$(nproc)
```

The manifest lives at the root of this repo (`default.xml`), which includes
`aosp-platform.xml` — a snapshot of AOSP's project list at the pinned
release tag. When bumping the AOSP tag, regenerate the snapshot from
`platform/manifest` at the new tag and strip its
`<remote>/<default>/<superproject>/<contactinfo>` elements.

## Build

```sh
source build/envsetup.sh
lunch matzphone_gsi-userdebug   # device targets appear in Phase 1
m -j$(nproc)
```

Signed release builds use keys that are never in CI; see
`vendor/matzphone/config/common.mk` for the signing hook.
