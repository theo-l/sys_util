#!/bin/bash
# script to find which files contains given String pattern

stringPattern=$1
searchPath=$2

echo "pattern" $stringPattern ", path" $searchPath

# find stringPattern in searchPath with caseInsensible
grep -r --color=auto -n -i "$stringPattern" $searchPath
