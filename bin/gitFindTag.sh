#!/bin/bash
#set -eu
pattern=$1

if [[ -z $pattern ]]; then
    echo -e "Usage: gitFindTag.sh pattern\n"
else
    git tag -l "$pattern"
fi

