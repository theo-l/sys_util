#!/bin/bash

path=$1

age=$2
echo "find file in $path which age is $age"

find $path -mtime $2
