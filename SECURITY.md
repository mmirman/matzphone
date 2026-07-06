# Security Policy

## Current status — read this first

MatzPhone is **pre-alpha scaffolding**. There are no releases, no signed
builds, and no devices in the field, so there is nothing we currently claim
to be secure. This policy exists so the reporting channel and expectations
are in place *before* the first testable build ships.

## Supported versions

| Version | Supported |
|---|---|
| (no releases yet) | — |

Once Phase 1 test builds exist, this table will list which builds receive
security fixes. The project's standing target from that point: ship fixes
for each monthly Android Security Bulletin within 7 days of publication.

## Reporting a vulnerability

Use **GitHub private vulnerability reporting** (enabled on this repository
and on `vendor_matzphone`): Security tab → "Report a vulnerability". Please
do not open public issues for security reports.

Include what you can: affected file/component, reproduction steps or PoC,
and impact assessment. You will get an acknowledgment within 7 days.

## Disclosure policy

- Coordinated disclosure with a **90-day** default embargo, extendable by
  mutual agreement if a fix genuinely needs longer.
- We will credit reporters in release notes unless you ask otherwise.
- No bug bounty exists yet; if one is created it will be announced here.

## Scope notes

- Vulnerabilities in upstream AOSP should go to
  [Google's Android security program](https://source.android.com/docs/security/overview/updates-resources#report-issues);
  we track their bulletins. Report here only if MatzPhone's configuration
  or patches introduce or re-expose the issue.
- The `tools/` scripts and CI workflows in this repo are in scope.
