#!/bin/bash
set -eu

for i in {0..255} ; do 
    printf "\x1b[38;5;${i}mccolour${i}\n"
done 
