#!/bin/bash
# Run Docker container based on docker image.
# Ex: serf event run nonfiction/nginx
IMAGE=$(cat)
echo "Run: $IMAGE"
echo "My role is $SERF_SELF_ROLE"

/usr/bin/docker run -d $IMAGE