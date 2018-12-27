#!/bin/bash
carthage update --platform iOS;
rm -R Carthage/Checkouts;
./scripts/_checkout_frameworks.sh;
