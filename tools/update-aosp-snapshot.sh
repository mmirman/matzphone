#!/bin/sh
# Regenerate aosp-platform.xml from AOSP's platform/manifest at a release tag
# and bump the pinned revision in default.xml. Run on monthly ASB bumps.
#
# Usage: tools/update-aosp-snapshot.sh android-15.0.0_r11
set -eu

TAG="${1:?usage: $0 <aosp-release-tag, e.g. android-15.0.0_r11>}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

echo "Fetching platform/manifest at $TAG ..."
curl -sf "https://android.googlesource.com/platform/manifest/+/refs/tags/$TAG/default.xml?format=TEXT" \
  | base64 -d > "$TMP"

TAG="$TAG" TMP="$TMP" OUT="$ROOT/aosp-platform.xml" python3 - <<'EOF'
import os
import xml.etree.ElementTree as ET

tag, tmp, out = os.environ['TAG'], os.environ['TMP'], os.environ['OUT']
root = ET.parse(tmp).getroot()

# Strip elements that would conflict with or break our top-level manifest:
# remote/default (we define our own), superproject and contactinfo (Google-internal).
for name in ('remote', 'default', 'superproject', 'contactinfo'):
    for el in root.findall(name):
        root.remove(el)

header = (
    '<?xml version="1.0" encoding="UTF-8"?>\n'
    '<!--\n'
    f'  Snapshot of AOSP platform/manifest default.xml at {tag},\n'
    '  with <remote>/<default>/<superproject>/<contactinfo> stripped (defined\n'
    '  by our top-level default.xml). Regenerate when bumping the AOSP tag.\n'
    '-->\n'
)
with open(out, 'w') as f:
    f.write(header + ET.tostring(root, encoding='unicode') + '\n')
print(f'aosp-platform.xml: {len(root.findall("project"))} projects at {tag}')
EOF

sed -i "s|refs/tags/android-[0-9.]*_r[0-9]*|refs/tags/$TAG|" "$ROOT/default.xml"
echo "default.xml pinned to refs/tags/$TAG"
echo "Done. Review the diff, run CI checks, then commit both files."
