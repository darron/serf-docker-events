#!/bin/bash
# Rout to started docker container.
PAYLOAD=$(cat)
echo "Route: $PAYLOAD"
echo "My role is $SERF_SELF_ROLE"