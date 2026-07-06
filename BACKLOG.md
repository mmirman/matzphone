# MatzPhone work backlog

Ordered queue of real work. Work cycles take the top unblocked item, do it,
check it off, and append newly discovered work at the appropriate priority.
If this file is ever empty and nothing is discoverable, say so honestly —
do not invent filler tasks.

## Now (Phase 0 close-out)
- [ ] Verify matzphone_gsi product graph evaluates (needs an AOSP checkout:
      `lunch matzphone_gsi-trunk_staging-userdebug` dry run — fold into the
      end-to-end repo sync verification below)
- [ ] End-to-end verify: `repo init -u https://github.com/mmirman/matzphone
      && repo sync` on a scratch machine (needs disk; may defer to the CI
      nightly)

## Next (Phase 1 prep)
- [ ] OWNER DECISION: purchase 2× unlocked Pixel 9 from Google Store
      (~$1.6K; requirements in docs/reference-device.md)
- [ ] Vendor patches directory + apply-patches script with CI check
- [ ] Signing key ceremony doc: how release keys are generated/stored
      offline
- [ ] OTA server design doc (static signed metadata + payload on CDN)
- [ ] Draft LinkedIn Post 2 (architecture: overlays-not-forks) for the
      weekly slot

## Business track (each item gated on owner approval before anything sends)
- [ ] Finalize outreach email variants for SHIFT, Murena, Volla from
      partner-research-2026-07.md; present to owner for approval
- [ ] Cost model spreadsheet for the Nitrokey-style preflashed-Pixel
      offering under the $50K budget
- [ ] Trademark search on "MatzPhone" before money is spent on branding

## Done
- [x] matzphone_tokay device product defined atop aosp_tokay (verified
      present in caimito tree at r10); caimito/zumapro projects confirmed
      already syncing via the AOSP snapshot — no manifest change needed
      (2026-07-06)
- [x] Reference device chosen: Pixel 9 `tokay` (trees verified present at
      android-15.0.0_r10; Pixel 9a is not); unlock/flash procedure
      documented in docs/reference-device.md (2026-07-06)
- [x] Landing page live at mirman.com/matzphone (GitHub Pages via Actions,
      deploy verified green, site returns 200) (2026-07-06)
- [x] SECURITY.md + GitHub private vulnerability reporting enabled on both
      repos (2026-07-06)
- [x] Nightly manifest-rot CI: ref-existence sampling via
      tools/check-manifest-refs.py + repo init smoke test (2026-07-06)
- [x] tools/update-aosp-snapshot.sh: regenerates aosp-platform.xml + bumps
      default.xml pin; verified idempotent at r10 (2026-07-06)
- [x] CI on vendor_matzphone: XML validation, mk syntax, product makefile
      invariants (2026-07-06)
- [x] matzphone_gsi lunch target (trunk_staging user/userdebug/eng) in
      vendor_matzphone products/; docs updated (2026-07-06)
- [x] Repo split: vendor/matzphone → github.com/mmirman/vendor_matzphone;
      manifest moved to root default.xml so `repo init` docs are true (2026-07-06)
- [x] aosp-platform.xml: real snapshot of AOSP platform manifest at
      android-15.0.0_r10, 1379 projects, conflicts stripped (2026-07-06)
- [x] Scaffold, docs, manifest, vendor tree, CI (2026-07-06)
- [x] Repo public + renamed to matzphone; history scrubbed of business docs
- [x] LinkedIn Post 1 published
- [x] Partner landscape research (verified, July 2026)
