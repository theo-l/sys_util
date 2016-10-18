#!/bin/bash

if [[ $# == 1 ]]; then
    path=$1
else
    path="."
fi

find $path -perm 444
