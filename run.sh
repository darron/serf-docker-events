#!/bin/bash
# Run Docker container based on docker image.
# Ex: serf event run nonfiction/nginx
IMAGE=$(cat)
echo "Run: $IMAGE"
echo "My role is $SERF_SELF_ROLE"

if [ $SERF_SELF_ROLE == 'serve' ]
then
  /usr/bin/docker run -P -d $IMAGE
  # TODO - get the port number and connect to hipache.
else
fi