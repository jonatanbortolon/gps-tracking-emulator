#!/bin/bash

if command -v meteor 2>&1 >/dev/null
then
    echo Meteor already installed
else
    echo Installing Meteor

    npx meteor
fi

NODE_TLS_REJECT_UNAUTHORIZED=0 meteor --port 3001