#!/bin/bash
set -u

process_name=$1

if [[ -z $process_name ]]; then
    printf "Usage: $0 process_name_pattern\n"
    return
fi

ps aux | grep -e ".*${process_name}.*"

