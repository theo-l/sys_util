#!/bin/bash
set -eu

if [[ $# == 2  ]]; then
    line=$1
    file=$2
    echo $line  $file
elif [[ $# == 1 ]]; then
    line=1000
    file=$1
    echo $line $file
else
    echo "Usage: readLog.sh [line] filename"
    exit 0
fi

tail -fn $line $file
