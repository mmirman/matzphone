# Reference device: Google Pixel 9 (`tokay`)

## Why the Pixel 9

- **AOSP support at our pinned tag.** `android-15.0.0_r10` already carries
  the Pixel 9 family trees — verified present in our `aosp-platform.xml`
  snapshot: `device/google/caimito` (+ `-sepolicy`,
  `-kernels/6.1`) and the Tensor G4 SoC directory `device/google/zumapro`.
  The Pixel 9a (`tegu`) is *not* in this tag and would force an AOSP bump.
- **Unlockable, re-lockable bootloader** with user-settable AVB root of
  trust — the exact security model MatzPhone promises (see
  [hardware-requirements.md](hardware-requirements.md)).
- **7 years of vendor support** (into 2031), long-lived kernel (6.1 GKI).
- **Flagship-class silicon** — matches the class of device we intend to
  sell preflashed, so bring-up work is directly product-relevant.

Family codenames for reference: the `caimito` trees cover Pixel 9 =
`tokay`, 9 Pro = `caiman`, 9 Pro XL = `komodo`; the 9 Pro Fold = `comet`
has its own trees. We target `tokay` only for bring-up; siblings can
follow once it boots.

## Purchase requirements (owner decision, ~$800/unit × 2)

- **Two units** of the same SKU: one daily flash target, one recovery /
  A-B comparison unit.
- Must be the **unlocked retail model bought from the Google Store** —
  carrier units (especially Verizon-sold) can have `OEM unlocking`
  permanently greyed out, which makes them useless to us.
- 128 GB is sufficient; color irrelevant.

## Unlock procedure (per unit, once)

1. Boot stock, connect to Wi-Fi (a Google login is NOT required), take all
   pending OTA updates so bootloader/firmware are current.
2. Settings → About phone → tap Build number ×7 to enable Developer
   options.
3. Developer options → enable **OEM unlocking** (needs network the first
   time) and **USB debugging**.
4. `adb reboot bootloader`, then `fastboot flashing unlock` — confirm on
   the device with volume/power keys. **This factory-resets the unit.**

## Flash procedure (AOSP/MatzPhone builds)

Until MatzPhone produces signed images, the bring-up loop is stock AOSP:

1. Sync our manifest — the Pixel 9 trees are already in the AOSP snapshot
   (`device/google/caimito*`, `device/google/zumapro*`) — then
   `lunch matzphone_tokay-trunk_staging-userdebug` (defined in
   `vendor/matzphone/products/`, layered on AOSP's `aosp_tokay`).
2. Download the matching **vendor/proprietary binaries** for the build ID
   from Google's driver-binaries page and extract them into the tree
   before building; they are not redistributable and never enter our repos.
3. `m` then `fastboot flashall -w` from `$OUT`, or
   `fastboot update <image.zip>`.
4. Recovery escape hatch: reflash the stock factory image (or use
   Google's web-based Android Flash Tool) — this is why unit #2 stays
   stock.

## Re-locking (later phase)

Custom AVB root of trust via `fastboot flash avb_custom_key` +
`fastboot flashing lock` comes in Phase 2 when we have release-signed
builds; do not lock with test-key builds.
