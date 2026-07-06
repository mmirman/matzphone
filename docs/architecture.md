# Architecture

MatzPhone is a downstream of AOSP, structured the way mature custom-ROM
projects (LineageOS, GrapheneOS, CalyxOS) structure theirs: a `repo`
manifest that pins upstream AOSP release tags and layers our repositories
on top. We deliberately do **not** fork frameworks/base wholesale; changes
land as either (a) runtime resource overlays, (b) small patches carried in
`vendor/matzphone/patches/` and applied at sync time, or (c) standalone apps
and services. This keeps rebases onto new AOSP releases tractable for a
small team.

## Layers

### 1. Upstream AOSP
Pinned to the latest `android-15.0.0_rXX` release tag in
`manifest/default.xml`. Security patch levels track the monthly ASB; we
target < 7 days from bulletin publication to OTA.

### 2. `vendor/matzphone`
The distribution layer:
- `config/common.mk` — product packages, default properties, feature flags.
- `overlay/` — RROs for framework and app defaults (see below).
- `patches/` — quilt-style patch series against upstream projects, each with
  a header stating why it exists and its upstream status.

### 3. Overlays instead of forks
Defaults we change via RRO rather than patching:
- `config_defaultUsbDataMode` — no data over USB while locked
- Wi-Fi MAC randomization enhanced mode on by default
- Sensors-off and per-app network toggles surfaced in Settings
- No default submission of usage/diagnostic data

### 4. Kernel
Per-device kernel trees under `kernel/<vendor>/<device>`, GKI-based where
the SoC supports it. Hardening config fragment
(`matzphone_defconfig.fragment`) enables `CONFIG_INIT_ON_ALLOC_DEFAULT_ON`,
`CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT`, disables `/dev/mem` and legacy
ptrace scopes.

### 5. Devices
Reference target for bring-up is a recent Pixel (unlockable bootloader,
long vendor support, well-understood device trees). The ODM-partnership
device gets a first-party device tree here once hardware is under NDA/DVT.

## Update model

- **OTA:** A/B seamless updates, signed with release keys held offline.
  Update server is a static-file design (signed metadata + payload on a
  CDN) — no dynamic server to compromise.
- **Verified boot:** AVB2 with our root of trust; user-settable root of
  trust supported so owners can re-lock with their own keys.

## What we are not doing

- Not a microkernel / not-Linux research OS. We want shippable hardware
  with mainstream app compatibility on a realistic timeline.
- No bundled app store initially; F-Droid and Aurora work out of the box,
  and we ship `fdroid` repo config as an opt-in.
