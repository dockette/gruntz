<h1 align=center>Dockette / Gruntz</h1>

<p align=center>
   <a href="https://github.com/dockette/gruntz/actions"><img src="https://github.com/dockette/gruntz/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/gruntz"><img src="https://img.shields.io/docker/pulls/dockette/gruntz.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
   Legacy Docker image for <a href="https://en.wikipedia.org/wiki/Gruntz">Gruntz</a>, an old-school Windows game run through Wine.
   Maintenance is limited to image buildability and non-interactive smoke checks.
</p>

-----

## Status

This image is maintained as a legacy GUI/game image. Runtime needs an X11 display, sound device, and manual interaction, so CI validates only the Docker build and packaged binary presence. The Docker Hub badge may be less representative than for headless images because this image is GUI-only and practical usage is local/interactive.

![Gruntz in Docker container](https://raw.githubusercontent.com/whaleapps/gruntz/master/docs/gruntz.png)

## Usage

```bash
docker run \
  --rm \
  -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -e DISPLAY=$DISPLAY \
  --device /dev/snd \
  -v /dev/shm:/dev/shm \
  dockette/gruntz:latest
```

Don't forget to allow xhost.

```bash
xhost +x
```

## Troubleshooting

Gruntz works only at resolution 640x480.

## Development

```bash
make build
make test
make run
```

The `test` target is intentionally limited to non-interactive smoke checks. It verifies Wine is available in the image and that the bundled Gruntz executable exists without trying to start the GUI game.

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
