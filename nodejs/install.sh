#!/bin/bash

echo "setting up node"
./node-npm.sh

echo "installing necessary apps"
./process-app.sh

echo "setting up mongodb"
./mongodb.sh
