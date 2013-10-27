#!/bin/bash
# Remove Docker container based on docker image.
# Ex: serf event rmi darron/nginx
RMI=$(cat)
echo "RMI: $RMI"
echo "My role is $SERF_SELF_ROLE"

/usr/bin/docker rmi $RMI