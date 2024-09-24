#!/bin/bash

if command -v meteor 2>&1 >/dev/null
then
    echo "=> Meteor already installed"
else
    echo "=> Installing Meteor"

    npx meteor
fi

url="http://localhost:9876/"

NODE_TLS_REJECT_UNAUTHORIZED=0 meteor --port 9876 | while IFS= read -r i
do 
    if ! [[ $(echo "${i}" | grep -i "\[\[\[\[\[") ]]
    then
        echo "${i/Started/Starting}"
    fi

    if [[ $(echo "${i}" | grep -i "=> App running at: ${url}") ]]
    then
        if [[ $(grep -i Microsoft /proc/version) ]]
        then
            cmd.exe /C start "${url}" &> /dev/null
        else
            xdg-open "${url}" &> /dev/null
        fi
    fi
done