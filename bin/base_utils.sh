#!/bin/bash

__find_empty_file_in_path__(){

    if [[ $# == 1 ]]; then
        path=$1
    else
        path="."
    fi

    find $path -type f -empty
}

__find_empty_dir_in_path__(){

    if [[ $# == 1 ]]; then
        path=$1
    else
        path="."
    fi

    find $path -type d -empty
}

__find_executalble_file_in_path__(){

    if [[ $# == 1 ]]; then
        path=$1
    else
        path="."
    fi

    find $path -perm /a=x
}

__find_hidden_file_in_path__(){

    if [[ $# == 1 ]]; then
        path=$1
    else
        path="."
    fi

    find $path -type f -name ".*"

}

__find_files_in_path_by_user__(){

    if [[ $# == 2 ]]; then
        path=$1
        user=$2
        find $path -user $user
        return
    fi

    if [[ $# == 1 ]]; then
        path="."
        user=$1
        find $path -user $user
        return
    else
        echo "Usage: $0 [path] user"
        exit 0
    fi
}
