#!/bin/bash
# Remove Docker container based on docker image.
# Ex: serf event rmi darron/nginx
RMI=$(cat)
echo "RMI: $RMI"
echo "$SERF_SELF_NAME role is $SERF_SELF_ROLE"

if [ $SERF_SELF_ROLE != 'master' ]
then
  /usr/bin/docker rmi $RMI
fi

