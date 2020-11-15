#!/bin/bash

# Checks out the dependencies.
if [ $# -eq 1 ] && [ $1 = "--skip-checkout" ]; then
  echo "";
else
  ./scripts/_checkout.sh;
fi

# Generate the xcode project.
xcodegen;
