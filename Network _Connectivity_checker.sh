#!/bin/bash
if ping-c 1 'l$host" &>/dev/null; then
  echo "Network is up."
else
  echo "Network is down."
fi
