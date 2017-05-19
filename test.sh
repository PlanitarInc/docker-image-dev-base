#!/bin/sh

set -ex

docker run --rm ${IMAGE_NAME} git --version
docker run --rm ${IMAGE_NAME} gcc --version
docker run --rm ${IMAGE_NAME} g++ --version
docker run --rm ${IMAGE_NAME} gpg --version

docker run --rm ${IMAGE_NAME} id -u planitar
docker run --rm ${IMAGE_NAME} \
  bash -c 'test "$HOME" == /home/planitar -a -d "$HOME"'

docker run --rm ${IMAGE_NAME} gosu root ifconfig
