# MatzPhone

An open-source, privacy-first mobile operating system built on the Android
Open Source Project (AOSP), with the long-term goal of shipping preinstalled
on high-end hardware through an ODM/OEM partnership.

> **Status: pre-alpha / scaffolding.** This repository currently contains the
> project structure, build manifests, configuration overlays, and design
> documentation. It does not yet produce a flashable image. See
> [docs/roadmap.md](docs/roadmap.md) for the honest state of things.

## Why another Android-based OS?

- **No bundled Google services by default.** MicroG and sandboxed Play
  Services are opt-in, not baked in.
- **Long support windows.** Target: 5+ years of security updates on flagship
  hardware, enforced contractually with the hardware partner.
- **Verifiable builds.** Reproducible-build CI so anyone can confirm the
  shipped image matches this source tree.
- **Sane defaults.** Hardened kernel config, per-app network permission,
  MAC randomization on, telemetry off.

## Architecture at a glance

```
AOSP (android-15 release tags)
 └── MatzPhone manifest (default.xml, this repo)
      ├── vendor/matzphone        — build config, branding, feature flags
      │                             (github.com/mmirman/vendor_matzphone)
      ├── overlays               — runtime resource overlays (RROs)
      ├── kernel/<device>        — per-device hardened kernel trees
      └── device/<vendor>/<name> — device trees for supported hardware
```

Details in [docs/architecture.md](docs/architecture.md).

## Building

See [docs/building.md](docs/building.md). Short version: standard
`repo init` / `repo sync` / `lunch` flow against our manifest, ~400 GB disk
and a beefy machine required — this is a full AOSP build.

## Roadmap

1. **Phase 1 — Bring-up (now):** manifest, vendor tree, CI, first booting
   build on a reference device (Pixel 8/9 class, unlocked bootloader).
2. **Phase 2 — Alpha:** daily-drivable on reference device; OTA
   infrastructure; reproducible builds.
3. **Phase 3 — Hardware partnership:** ODM engagement for a flagship device
   shipping MatzPhone as factory firmware. Requirements in
   [docs/hardware-requirements.md](docs/hardware-requirements.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Licensed under
[Apache-2.0](LICENSE), matching AOSP userspace.
