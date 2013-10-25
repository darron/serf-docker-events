#!/bin/bash
# Tell master that it's built.
PAYLOAD=$(cat)
echo "Built: $PAYLOAD"
echo "My role is $SERF_SELF_ROLE"
