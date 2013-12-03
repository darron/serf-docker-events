#!/bin/bash
# Run Docker container based on docker image.
# Ex: serf event run nonfiction/nginx
IMAGE=$(cat)
INTERNAL_PORT="5000"
BASE=`echo "$IMAGE" | awk -F'/' '{print $2}'`

echo "Run: $IMAGE"
echo "My role is $SERF_SELF_ROLE"

if [ $SERF_SELF_ROLE == 'serve' ]
then
  OLD_ID=$(sudo docker ps | grep "$IMAGE:latest" | cut -d ' ' -f 1)
  ID=$(sudo /usr/bin/docker run -P -d $IMAGE)
  PORT=$(sudo docker port $ID $INTERNAL_PORT | sed 's/0.0.0.0://')
  
  # Get Public IP address.
  PUBLIC_IP=$(curl -s http://ipv4.icanhazip.com)
  # Set the domain name here if desired.
  DOMAIN_SUFFIX="$PUBLIC_IP.xip.io"
  
  # Zero out any existing items.
  /usr/bin/redis-cli ltrim frontend:$BASE.$DOMAIN_SUFFIX 200 200
  # Connect $BASE.$PUBLIC_IP.xip.io to the $PORT
  /usr/bin/redis-cli rpush frontend:$BASE.$DOMAIN_SUFFIX $BASE
  /usr/bin/redis-cli rpush frontend:$BASE.$DOMAIN_SUFFIX http://127.0.0.1:$PORT
  
fi