# Building oss-phone

> Pre-alpha: the manifest currently pins upstream AOSP plus our vendor
> tree. Until Phase 1 lands a device tree, the build produces a GSI-style
> target, not a device image.

## Requirements

- Linux x86_64, 64 GB RAM recommended (32 GB minimum with zram)
- ~400 GB free SSD space
- `repo`, and the standard AOSP build dependencies for your distro

## Sync

```sh
mkdir ossphone && cd ossphone
repo init -u https://github.com/oss-phone/manifest -b main
repo sync -c -j$(nproc)
```

## Build

```sh
source build/envsetup.sh
lunch ossphone_gsi-userdebug   # device targets appear in Phase 1
m -j$(nproc)
```

Signed release builds use keys that are never in CI; see
`vendor/ossphone/config/common.mk` for the signing hook.
