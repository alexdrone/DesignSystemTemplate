#!/bin/bash

# Checks out the dependencies.
if [ $# -eq 1 ] && [ $1 = "--skip-checkout" ]; then
  echo "";
else
  ./scripts/_checkout.sh;
fi

# Import icon assets.
# ADD DESIRED ICONS AS ARGS..
./scripts/_import_icons.sh category edit place pin_drop

# Generate the xcode project.
xcodegen;
