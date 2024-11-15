#!/bin/bash

# Update system packages and clean up unnecessary packages

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean
echo "System packages updated and cleaned up"
