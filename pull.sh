#!/bin/bash
# Pull Docker container based on url.
# Ex: serf event pull darron/redis
CONTAINER=$(cat)
echo "Pull: $CONTAINER"
echo "My role is $SERF_SELF_ROLE"

if [ $SERF_SELF_ROLE == 'serve' ]
then
  /usr/bin/docker pull $CONTAINER
  serf event run $CONTAINER
fi