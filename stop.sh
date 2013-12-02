#!/bin/bash
# Stop Docker container based on container id.
# Ex: serf event stop 6edec2ef1343
ID=$(cat)
echo "Stop: $ID"
echo "My role is $SERF_SELF_ROLE"

if [ $SERF_SELF_ROLE == 'serve' ]
then
  /usr/bin/docker stop $ID
fi