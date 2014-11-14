# XXX no versioning of the docker image
IMAGE_NAME=planitar/dev-base

ifneq ($(NOCACHE),)
  NOCACHEFLAG=--no-cache
endif

.PHONY: build push clean test

build:
	docker build ${NOCACHEFLAG} -t ${IMAGE_NAME} .

push:
	docker push ${IMAGE_NAME}

clean:
	docker rmi -f ${IMAGE_NAME} || true

test:
	docker run -d --name test-dev-base ${IMAGE_NAME} /bin/bash -c ' \
	  git --version || exit 1; \
	  gcc --version || exit 1; \
	  g++ --version || exit 1; \
	  gpg --version || exit 1; \
	  id -u planitar || exit 1; \
	  test "$$HOME" == /home/planitar -a -d "$$HOME" || exit 1; \
	  sudo ifconfig || exit 1; \
	'
	if ! docker wait test-dev-base | grep -q 0; then \
	  docker logs test-dev-base >&2; \
	  docker rm -f test-dev-base; \
	  false; \
	fi
	docker rm -f test-dev-base
