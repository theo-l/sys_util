#!/usr/bin/python
# -*- coding=utf-8 -*-

from shell_runner import run_shell


def display_colors():
    for i in range(0,256):
        command='printf "\x1b[38;5;%dmccolour%d\n"'%(i, i)
        run_shell(command)

#for i in {0..255} ; do 
#    printf "\x1b[38;5;${i}mccolour${i}\n"
#done 

if __name__ =="__main__":
     display_colors()
