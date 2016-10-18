#!/usr/bin/python
# -*- coding=utf-8 -*-

import os

def run_shell(command, *args):
    if len(args)>0:
        command=command%(args)

    os.system(command)


if __name__ =="__main__":
     command="ls"
     run_shell(command)
