# XXX no versioning of the docker image

.PHONY: build push clean test

build:
	docker build -t planitar/dev-base .

push:
	docker push planitar/dev-base

clean:
	docker rmi -f planitar/dev-base || true

test:
	docker run -d --name test-dev-base planitar/dev-base /bin/bash -c ' \
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
