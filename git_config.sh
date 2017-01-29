#!/usr/bin/env bash

__git_config() {
    git config --global user.email "theol.liang@gamil.com"
    git config --global user.name "theo-l"
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=7200' #两个小时的有效期
}

__git_config
