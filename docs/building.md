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
repo init -u https://github.com/MatzPhone/manifest -b main
repo sync -c -j$(nproc)
```

## Build

```sh
source build/envsetup.sh
lunch matzphone_gsi-userdebug   # device targets appear in Phase 1
m -j$(nproc)
```

Signed release builds use keys that are never in CI; see
`vendor/matzphone/config/common.mk` for the signing hook.
