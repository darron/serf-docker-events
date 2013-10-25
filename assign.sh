#!/bin/bash
# Assign role to server.
PAYLOAD=$(cat)
echo "Assign to $PAYLOAD role."
echo "My role is $SERF_SELF_ROLE"
