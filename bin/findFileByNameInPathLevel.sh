#!/bin/bash

exp=$1
path=$2
level=$3

echo $@

#function used to find a file in specified path with specified filename pattern
function findFileByNameInPaths {

    if [[ $# < 2 ]]; then
        echo "Usage findFileByNameInPath filename_pattern path level(default=1)"
        return
    fi

    level=1
    
    if [[ $# == 3 ]]; then
       level=$3 
    fi

    filename=$1
    path=$2
    
    
    find $path -maxdepth $level -name "$filename"
}

findFileByNameInPaths  "$exp" $path $level
