#!/bin/bash

# Script to open current git repo in browser if
# cloned using SSH

# Need to first get the url
url=$(git config --get remote.origin.url)
echo "SSH URL:"
echo $url

# Extract properties from url
IFS='@:/' read -r -a array <<< "$url"

domain=${array[1]}
user=${array[2]}
repo=${array[3]}

# Build up new https url
browserUrl="https://${domain}/${user}/${repo}"

echo ""
echo "     |"
echo "     V"
echo ""

echo "HTTPS URL:"
echo $browserUrl

open $browserUrl
