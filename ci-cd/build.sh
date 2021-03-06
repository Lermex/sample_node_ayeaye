#!/bin/bash -e

if [ "$IS_PULL_REQUEST" != true ]; then

  docker build --rm --force-rm=true --tag $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION --file Dockerfile .

  docker tag -f $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:latest

else
  echo "skipping because it's a PR"
fi
