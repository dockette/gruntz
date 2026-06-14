DOCKER_IMAGE=dockette/gruntz
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm --entrypoint sh ${DOCKER_IMAGE}:${DOCKER_TAG} -lc 'wine --version'
	docker run --rm --entrypoint sh ${DOCKER_IMAGE}:${DOCKER_TAG} -lc 'test -f /srv/gruntz/GRUNTZ.exe'

.PHONY: run
run:
	docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$$DISPLAY --device /dev/snd -v /dev/shm:/dev/shm ${DOCKER_IMAGE}:${DOCKER_TAG}
