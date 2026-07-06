# Contributing to MatzPhone

Thanks for your interest. The project is pre-alpha; the highest-value
contributions right now are device bring-up, CI, and documentation review.

## Ground rules

- All code is licensed **Apache-2.0** (kernel trees remain GPL-2.0 as
  upstream requires). By submitting a change you agree to license it under
  the file's existing license.
- One logical change per commit. Commit messages: short imperative subject,
  body explaining *why*.
- No proprietary blobs in this organization's repositories. Vendor blobs are
  extracted at build time from stock firmware, never redistributed.

## Workflow

1. Fork, branch from `main`.
2. For anything non-trivial, open an issue first describing the approach.
3. Open a PR. CI must pass (build check + `repo` manifest validation).
4. One maintainer approval required to merge.

## Areas that need help

| Area | Skills |
|------|--------|
| Device trees / bring-up | AOSP device porting, kernel |
| OTA server | Go/Rust, signing infrastructure |
| Reproducible builds | Bazel/soong, CI |
| Docs & website | Technical writing |

## Conduct

Be professional and assume good faith. Harassment or personal attacks get
one warning, then a ban. Report issues to the maintainers privately.
