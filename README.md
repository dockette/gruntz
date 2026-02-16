# Gruntz

Famous old school game (https://en.wikipedia.org/wiki/Gruntz).

![Gruntz in Docker container](https://raw.githubusercontent.com/whaleapps/gruntz/master/docs/gruntz.png)

## Usage

```
docker run \
	   --rm \
       -it \
       -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
       -e DISPLAY=$DISPLAY \
       --device /dev/snd \
       -v /dev/shm:/dev/shm \
       whaleapps/gruntz
```

Don't forget to allow xhost.

```
xhost +x
```

## Troubleshooting

Gruntz works only at resolution 640x480.	

## Maintenance
See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
