# AGENTS.md

## Repository

`dockette/gruntz` is a legacy Docker image for running the Windows game Gruntz through Wine.

## Scope

- Keep changes focused on image buildability, smoke checks, and documentation.
- Treat this as a GUI/game image; do not try to run the full interactive game in CI.
- Prefer non-interactive validation such as Wine version checks and packaged binary presence.

## Commands

- `make build` builds `dockette/gruntz:${DOCKER_TAG}` for `${DOCKER_PLATFORMS}`.
- `make test` runs smoke checks against the built image.
- `make run` starts the GUI container with X11 and sound mounts for local/manual testing.

## CI

The Docker workflow has Test, Build, and Docs jobs. The default build platform is `linux/amd64` because the image depends on Wine and a legacy GUI runtime.
