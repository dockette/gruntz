DOCKER_IMAGE=dockette/gruntz
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64
VERSION:=$(shell cat VERSION)

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm --entrypoint sh ${DOCKER_IMAGE}:${DOCKER_TAG} -lc 'wine --version'
	docker run --rm --entrypoint sh ${DOCKER_IMAGE}:${DOCKER_TAG} -lc 'test -f /srv/gruntz/GRUNTZ.EXE'

.PHONY: run
run:
	docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$$DISPLAY --device /dev/snd -v /dev/shm:/dev/shm ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@date -u +%Y.%m.%d > VERSION
	@echo "VERSION: ${VERSION} -> $$(cat VERSION)"
	@echo "next: git commit -am \"Release: $$(cat VERSION)\" && git push"
