#!/bin/bash

if [ -d "/opt/code" ] ; then
  sudo -E -u jenkins bash -c "/build.sh"
fi
