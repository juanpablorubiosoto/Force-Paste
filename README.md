# Force Paste.app (macOS)

Small AppleScript app that pastes clipboard contents by simulating keystrokes (useful when paste is blocked).

## Build
```sh
cd /Users/mariajoseduque/Desktop/JUAN PABLO/GTHB/Force-Paste
./build.sh
```
This produces:
- `Force Paste.app`
- `Force-Paste.zip`

## Sign
Use your Developer ID Application certificate:
```sh
codesign --force --timestamp --options runtime --sign "Developer ID Application: YOUR NAME (TEAMID)" "Force Paste.app"
```

Verify the signature:
```sh
codesign --verify --deep --strict --verbose=2 "Force Paste.app"
```

## Install (move to Applications)
```sh
mv "Force Paste.app" /Applications/
```

## Local Install Script (recommended for Ventura)
This rebuilds, ad-hoc signs, installs, resets TCC prompts, and launches the app:
```sh
./install_local.sh
```
Skip TCC reset:
```sh
./install_local.sh --no-tcc
```

## First Run Permissions
On macOS Ventura or newer, allow Accessibility access:
1. System Settings -> Privacy & Security -> Accessibility
2. Add:
   - `/Applications/Force Paste.app`
   - `/Applications/Force Paste.app/Contents/MacOS/applet`
   - `/Applications/Utilities/Script Editor`

If you see a "not allowed to send keystrokes" error, remove the entries and re-add them.

## Ventura Automation Fix (-1743)
If you get: `Not authorised to send Apple events to System Events. (-1743)`:
```sh
tccutil reset AppleEvents com.forcepaste.app
tccutil reset Accessibility com.forcepaste.app
killall tccd
open "/Applications/Force Paste.app"
```
Then allow **System Events** under:
System Settings -> Privacy & Security -> Automation.

## Usage
Copy text, then launch the app from the Dock. It will type the clipboard content into the focused field.
