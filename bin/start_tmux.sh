#!/bin/bash

#set -x #debug script switch

session=dev
if [[ ! -z "$1" ]]; then
    session=$1
fi

cmd=$(which tmux)

if [[ -z $cmd ]]; then
    echo "you need to install tmux"
    exit 1
fi

$cmd has -t $session


if [[ $? != 0 ]]; then
    $cmd new -d -n main  -s $session 
    $cmd splitw -v -p 50 -t main
    $cmd neww -n tools  -t $session 
    $cmd splitw -v -p 50 -t tools
    $cmd neww -n database -t $session 
    $cmd neww -n log -t $session 
    $cmd neww -n note -t $session 
fi

$cmd attach -t $session

exit 0
