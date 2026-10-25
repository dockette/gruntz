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

![Gruntz in Docker container](https://raw.githubusercontent.com/whaleapps/gruntz/master/docs/gruntz.png)

This image is a legacy GUI game image. The game needs an X11 display, a sound device and manual interaction, so CI
checks only the Docker build and that the game binary exists. The Docker Hub pull badge is less representative than for
headless images, because the image is mostly used locally.

## Features

- Gruntz `v1.0` from [whaleapps/gruntz](https://github.com/whaleapps/gruntz/releases) in `/srv/gruntz`, run through Wine
  (`suchja/wine` base image)
- `linux/amd64` only: the image depends on Wine and a legacy GUI runtime
- Gruntz works only at resolution 640x480

## Usage

```sh
# Allow the container to use your X server
xhost +x

docker run \
  --rm \
  -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -e DISPLAY=$DISPLAY \
  --device /dev/snd \
  -v /dev/shm:/dev/shm \
  dockette/gruntz:latest
```

## Versions

| Version | Release |
|---------|---------|
| `dockette/gruntz:YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/gruntz:latest` | latest build of `master` |

Releases are listed on [GitHub](https://github.com/dockette/gruntz/releases).

## Development

```sh
make build          # build the image
make test           # check that Wine runs and GRUNTZ.EXE exists, without starting the game
make run            # start the game with X11 and sound mounts
make version        # print VERSION
make release        # set today's date in VERSION
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to
[support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
