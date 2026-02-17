#!/bin/bash
set -euo pipefail

APP_NAME="Force Paste.app"
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$ROOT_DIR"
./build.sh

# Ad-hoc sign so Ventura reliably prompts for Automation permissions.
codesign --force --deep --sign - "$APP_NAME"

rm -rf "/Applications/$APP_NAME"
mv "$APP_NAME" "/Applications/$APP_NAME"

# Clear quarantine flags if present (safe even if none exist).
xattr -c "/Applications/$APP_NAME" || true

if [[ "${1:-}" != "--no-tcc" ]]; then
	# Force Ventura to re-prompt for Accessibility + Automation (scoped to bundle id).
	tccutil reset Accessibility com.forcepaste.app || true
	tccutil reset AppleEvents com.forcepaste.app || true
	killall tccd || true
fi

open "/Applications/$APP_NAME"

echo "Done:"
echo "- Built and signed $APP_NAME"
echo "- Installed to /Applications"
if [[ "${1:-}" != "--no-tcc" ]]; then
	echo "- Reset TCC for com.forcepaste.app and restarted tccd"
else
	echo "- Skipped TCC reset (--no-tcc)"
fi
echo "- Launched the app"
