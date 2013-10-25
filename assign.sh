#!/bin/bash
# Assign role to server.
PAYLOAD=$(cat)
TARGET=$(echo $PAYLOAD | cut -f1 -d,)
ROLE=$(echo $PAYLOAD | cut -f2 -d,)

echo "Assign $TARGET to $ROLE role."
echo "$SERF_SELF_NAME: My current role is $SERF_SELF_ROLE"

if [ $SERF_SELF_NAME == $TARGET ]
then
  echo "ROLE=$ROLE" > /etc/serf/role
  echo "Changing $SERF_SELF_NAME to $ROLE"
  service serf reload
else
  echo "Not changing $SERF_SELF_NAME's role."
fi