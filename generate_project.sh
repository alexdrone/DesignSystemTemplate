#!/bin/bash

# Checks out the dependencies.
if [ $1 = "--skip-checkout" ]; then
  echo "";
else
  ./scripts/_checkout.sh;
fi

# Import icon assets.
# ADD DESIRED ICONS AS ARGS..
./scripts/_import_icons.sh category edit 

# Generate the xcode project.
xcodegen;
