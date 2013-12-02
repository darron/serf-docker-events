#!/bin/bash
# Build Docker container based on git repo with Dockerfile.
# Ex: "serf event build http://git.repo.goes.here,image"
PAYLOAD=$(cat)
REPO=$(echo $PAYLOAD | cut -f1 -d,)
IMAGE=$(echo $PAYLOAD | cut -f2 -d,)
BUILD_DIR=`mktemp -d`

echo "Build: $REPO as $IMAGE in $BUILD_DIR"
echo "My role is $SERF_SELF_ROLE"

if [ $SERF_SELF_ROLE == 'build' ]
then
  git clone $REPO $BUILD_DIR
  echo "/usr/bin/docker build -t octohost/$IMAGE $BUILD_DIR"
  /usr/bin/docker build -t octohost/$IMAGE $BUILD_DIR

  # Tag

  # Push
else
  echo "$SERF_SELF_NAME is not in a build role."
fi