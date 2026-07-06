# MatzPhone work backlog

Ordered queue of real work. Work cycles take the top unblocked item, do it,
check it off, and append newly discovered work at the appropriate priority.
If this file is ever empty and nothing is discoverable, say so honestly —
do not invent filler tasks.

## Now (Phase 0 close-out)
- [ ] Verify matzphone_gsi product graph evaluates (needs an AOSP checkout:
      `lunch matzphone_gsi-trunk_staging-userdebug` dry run — fold into the
      end-to-end repo sync verification below)
- [ ] Script `tools/update-aosp-snapshot.sh` to regenerate
      aosp-platform.xml on ASB tag bumps (currently a manual procedure
      documented in docs/building.md)
- [ ] End-to-end verify: `repo init -u https://github.com/mmirman/matzphone
      && repo sync` on a scratch machine (needs disk; may defer to the CI
      nightly)
- [ ] CI: add a nightly job that syncs the manifest on a schedule and
      reports breakage (manifest rot detection)
- [ ] Write SECURITY.md (report channel, embargo policy)
- [ ] Project website: static landing page (GitHub Pages) with honest
      status, linking repo and roadmap

## Next (Phase 1 prep)
- [ ] Pick exact reference device (Pixel 9/9a) and document unlock/flash
      procedure; owner to purchase 2 units from hardware budget (~$1.6K)
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
