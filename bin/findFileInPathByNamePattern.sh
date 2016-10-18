#!/bin/bash

if [[ $# == 2 ]]; then
    path=$1
    pattern=$2

elif [[ $# == 1 ]]; then
    path="."
    pattern=$1
else
    echo "Usage findFileInPathByNamePattern.sh [path] pattern"
    exit 0
fi

echo "findFileInPathByNamePattern.sh $path \"$pattern\""
find $path -type f -iname "$pattern"
