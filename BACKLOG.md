# MatzPhone work backlog

Ordered queue of real work. Work cycles take the top unblocked item, do it,
check it off, and append newly discovered work at the appropriate priority.
If this file is ever empty and nothing is discoverable, say so honestly —
do not invent filler tasks.

## Now (Phase 0 close-out)
- [ ] Split repos to match the manifest: create `matzphone/manifest` and
      `matzphone/vendor_matzphone` layout (or adjust manifest to the
      monorepo reality) so `repo init` instructions in docs/building.md
      are actually true
- [ ] Add `aosp-platform.xml` include or switch manifest to AOSP's
      platform manifest include mechanism that actually resolves
- [ ] Add matzphone_gsi lunch target definition under vendor/matzphone
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
- [x] Scaffold, docs, manifest, vendor tree, CI (2026-07-06)
- [x] Repo public + renamed to matzphone; history scrubbed of business docs
- [x] LinkedIn Post 1 published
- [x] Partner landscape research (verified, July 2026)
