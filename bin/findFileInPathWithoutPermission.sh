#!/bin/bash

if [[ $# == 2 ]]; then
    path=$1
    perm=$2

elif [[ $# == 1 ]]; then
    path="."
    perm=$1

else
    echo "Usage: findFileInPathByPermission.sh [path] perm"
    exit 0
fi

find $path -type f ! -perm $perm 
