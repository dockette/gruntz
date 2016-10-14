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