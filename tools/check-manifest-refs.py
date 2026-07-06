#!/usr/bin/env python3
"""Manifest rot check: verify pinned revisions still resolve on their remotes.

Parses default.xml + aosp-platform.xml, then `git ls-remote`s a deterministic
sample of AOSP projects (every Nth) and ALL non-AOSP projects. Exits non-zero
if any pinned ref no longer exists — e.g. a deleted tag, a renamed repo, or
manifest/include drift.

Usage: tools/check-manifest-refs.py [--stride 100]
"""
import argparse
import subprocess
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def load_projects():
    top = ET.parse(ROOT / 'default.xml').getroot()
    inc = ET.parse(ROOT / 'aosp-platform.xml').getroot()

    remotes = {r.get('name'): r.get('fetch').rstrip('/')
               for r in top.findall('remote')}
    default = top.find('default')
    default_remote = default.get('remote')
    default_rev = default.get('revision')

    projects = []
    for el in list(top.findall('project')) + list(inc.findall('project')):
        remote = el.get('remote') or default_remote
        rev = el.get('revision') or default_rev
        projects.append((el.get('name'), remotes[remote], rev, remote))
    return projects, default_remote


def ref_exists(url, rev):
    # A pinned sha can't be ls-remote'd; treat 40-hex revisions as always-ok.
    if len(rev) == 40 and all(c in '0123456789abcdef' for c in rev):
        return True
    ref = rev if rev.startswith('refs/') else f'refs/heads/{rev}'
    try:
        out = subprocess.run(
            ['git', 'ls-remote', url, ref, ref + '^{}'],
            capture_output=True, text=True, timeout=60)
    except subprocess.TimeoutExpired:
        return False
    return out.returncode == 0 and bool(out.stdout.strip())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--stride', type=int, default=100,
                    help='check every Nth AOSP project (default 100)')
    args = ap.parse_args()

    projects, default_remote = load_projects()
    aosp = [p for p in projects if p[3] == default_remote]
    ours = [p for p in projects if p[3] != default_remote]
    sample = ours + aosp[::args.stride]

    print(f'{len(projects)} projects in manifest; '
          f'checking {len(sample)} ({len(ours)} non-AOSP + stride {args.stride})')
    failures = []
    for name, fetch, rev, _ in sample:
        url = f'{fetch}/{name}'
        ok = ref_exists(url, rev)
        print(f'{"OK  " if ok else "FAIL"} {url} @ {rev}')
        if not ok:
            failures.append((url, rev))

    if failures:
        print(f'\n{len(failures)} unresolvable ref(s) — manifest rot detected.')
        sys.exit(1)
    print('\nAll sampled refs resolve.')


if __name__ == '__main__':
    main()
