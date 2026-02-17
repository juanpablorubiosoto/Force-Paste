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

## First Run Permissions
On macOS Ventura or newer, allow Accessibility access:
1. System Settings -> Privacy & Security -> Accessibility
2. Add:
   - `/Applications/Force Paste.app`
   - `/Applications/Force Paste.app/Contents/MacOS/applet`
   - `/Applications/Utilities/Script Editor`

If you see a "not allowed to send keystrokes" error, remove the entries and re-add them.

## Usage
Copy text, then launch the app from the Dock. It will type the clipboard content into the focused field.

