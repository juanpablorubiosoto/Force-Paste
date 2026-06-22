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

<!-- CODEX_RUNTIME_VALIDATION_START -->
## Runtime Validation And Deployment

- Before changing code, identify the app's runtime target from the labels or service name provided by the user. Use those labels to find the matching Coolify/Docker resource.
- Runtime access is through either `ssh asus-main` or `ssh asus-second`. Try the host indicated by the user first; if it is not specified, check both.
- On the runtime host, locate the service with Docker/Coolify labels such as `coolify.*`, `traefik.*`, compose project/service labels, or the explicit labels supplied by the user. Use `docker ps`, `docker inspect`, and container logs to confirm the exact target before acting.
- Validate locally first with the repo's normal checks, for example `npm test`, `npm run lint`, `npm run build`, `pnpm test`, `pnpm lint`, `pnpm build`, `python -m pytest`, or the closest project-specific command available. If no automated check exists, at least run the relevant syntax/type/build command and state the gap.
- After local validation, validate the real behavior in runtime via SSH against the identified container/service. Prefer health endpoints, logs, and direct service checks over assumptions.
- For Coolify-managed apps, a commit followed by `git push` to the deployed branch triggers autodeploy. After pushing, watch the new image/container become healthy on the runtime host and re-run the runtime validation.
- Do not rely only on local success when the user asks about production/runtime behavior. Confirm on `asus-main` or `asus-second` using the runtime labels and target server.
<!-- CODEX_RUNTIME_VALIDATION_END -->

