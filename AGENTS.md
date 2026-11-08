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
- `make version` prints `VERSION`; `make release` sets it to today's date. `GRUNTZ_VERSION` in `VERSION` pins the downloaded game release (Dockerfile `ARG`, passed by `make build` and CI). CI pushes `latest` also as `<VERSION>`, `<GRUNTZ_VERSION>` and `<GRUNTZ_VERSION>-<VERSION>`, and creates the GitHub release.

## CI

The Docker workflow has Test, Build, Release, and Docs jobs. Build is one job that pushes all tags on `master` only. The default build platform is `linux/amd64` because the image depends on Wine and a legacy GUI runtime.
