# Roadmap

Honest status, updated as things actually land. Dates are targets, not
promises.

## Phase 0 — Scaffolding (July 2026) — CURRENT
- [x] Repository structure, license, contribution guidelines
- [x] Build manifest skeleton (`manifest/default.xml`)
- [x] Vendor tree skeleton with initial RRO defaults
- [x] CI: manifest + overlay XML validation, docs link check (smoke build deferred to Phase 1 — needs a beefy self-hosted runner)
- [ ] Public GitHub organization + repo split (manifest, vendor, docs)

## Phase 1 — Bring-up (target: Q4 2026)
- [ ] First booting build on reference device (Pixel 8/9 class)
- [ ] Signed test-keys builds published for testers
- [ ] Patch series against android-15 kept green in CI

## Phase 2 — Alpha (target: H1 2027)
- [ ] Daily-drivable: calls, SMS, camera, GPS, VoLTE on reference device
- [ ] OTA pipeline live (A/B, signed, static-file server)
- [ ] Reproducible builds verified by third party
- [ ] Security model doc + external review

## Phase 3 — Hardware partnership (timeline depends on funding)
- [ ] ODM shortlist + RFQ (partner strategy maintained privately)
- [ ] EVT device with MatzPhone as factory firmware
- [ ] Certification: FCC/CE, carrier IOT as applicable
- [ ] Retail launch

## Explicitly out of scope for v1
- Tablet/desktop form factors
- Custom SoC or board design — we ship on a proven ODM platform
