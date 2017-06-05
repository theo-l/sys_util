#!/bin/bash
# Configuration zsh shell as user shell and use oh-my-zsh

__config_zsh_shell() {
    
    # 1. check if zsh exist
    if [[ -z $(which zsh) ]]; then
        printf "zsh does not exist, you need to install it first!"
        return 1
    fi

    # 2. check if powerline fonts installed 
    source ./install_powerline_font.sh

    # 3. check if oh-my-zsh installed and configured

    if [[ ! -d ~/.oh-my-zsh ]]; then
        #statements
    fi

    
}


__config_zsh_shell
