# Force Paste Agent Notes

## Standard Local Deploy (Ventura)
Use the local install script:
```sh
./install_local.sh
```
Skip TCC reset:
```sh
./install_local.sh --no-tcc
```

This will:
- Build the app
- Ad-hoc sign it
- Install to `/Applications`
- Reset TCC prompts (Accessibility + AppleEvents)
- Launch the app to trigger permission dialogs

## Ventura Automation Error (-1743)
If you see: `Not authorised to send Apple events to System Events. (-1743)`
run:
```sh
tccutil reset AppleEvents com.forcepaste.app
tccutil reset Accessibility com.forcepaste.app
killall tccd
open "/Applications/Force Paste.app"
```
Then allow **System Events** under:
System Settings -> Privacy & Security -> Automation.
