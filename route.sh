#!/bin/bash
# Rout to started docker container.
PAYLOAD=$(cat)
CONTAINER=$(echo $PAYLOAD | cut -f1 -d,)
NAME=$(echo $CONTAINER | cut -f2 -d/)
IP=$(echo $PAYLOAD | cut -f2 -d,)
PORT=$(echo $PAYLOAD | cut -f3 -d,)

echo "Route: $CONTAINER as $NAME to $IP and $PORT"
echo "My role is $SERF_SELF_ROLE"

if [ $SERF_SELF_ROLE == 'route' ]
then
  # Grab data about the container's domain name. (etcd, Dynamo, etc.)
  $DOMAIN_NAME = "www.testing.com" # FIXME

  # Setup Hipache
  redis-cli rpush frontend:$DOMAIN_NAME $NAME
  redis-cli rpush frontend:$DOMAIN_NAME http://$IP:$PORT

  # TODO: Take out old routes - or make sure all routes are consistent.
else
  echo "$SERF_SELF_NAME is not in a route role."
fi
