#!/bin/bash
#Install the most common util software in linux

install_command="sudo apt-get install "

typeset -a util_softwares

util_softwares=(
    git
    tmux
    zsh
    python-dev
    python3-dev
    python-pip
    python3-pip
    htop
    build-essential
    silversearcher-ag
    ipython
    ipython3
    w3m
)

__install_util_softwares() {
    
    for app in ${util_softwares[@]}; do
        if [[ -z $(which $app) && -z $(dpkg --list | grep $app) ]]; then
            printf "Software %-20s not exists, installing it ...\n" "<$app>"
            $install_command $app
        else
            printf "Software %-20s already exists ...\n" "<$app>"
        fi
    done
}

__install_util_softwares

