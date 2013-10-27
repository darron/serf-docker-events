#!/bin/bash
# Stop Docker container based on docker image.
# Ex: serf events stop 6edec2ef1343
ID=$(cat)
echo "Stop: $ID"
echo "My role is $SERF_SELF_ROLE"

/usr/bin/docker stop $ID