#!/usr/bin/env bash

export GIT_HOME="/home/dev/GitWorkspace/"
theme_repo="tmux-powerline"

if [[ ! -d ${GIT_HOME}/${theme_repo} ]]; then
    git clone "https://github.com/theo-l/$theme_repo" $GIT_HOME/$theme_repo
fi

