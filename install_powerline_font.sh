#!/usr/bin/env bash
export GIT_HOME="/home/dev/GitWorkspace"



__powerline_font_config() {
    

    if [[ -z $(ls ~/.local/share/fonts | grep powerline) ]]; then
        echo -e "\nInstalling powerline fonts\n"        

        # 将 powerline 字体安装到系统中
        git clone https://github.com/theo-l/fonts.git  $GIT_HOME/fonts
        cd "$GIT_HOME/fonts"
        source "./install.sh"

        # 刷新系统中的字体
        fc-cache -r
    else
        echo -e "Powerline fonts already installed\n"
    fi

}

__powerline_font_config
