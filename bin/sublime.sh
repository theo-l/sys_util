#!/bin/bash
set -eu

LD_PRELOAD=$SHELL_PATH_HOME/libsublime-imfix.so;/usr/bin/subl
