#!/bin/bash
set -eu

############################################################
# 安装个人常用的实用软件列表
# 各个软件工具的个人偏好配置
############################################################


declare -a common_software_profil_list=(
    vim 
    vim-gnome 
    git 
    tmux 
    ipython 
    ipython3 
    python-dev 
    python3-dev 
#    python-mysqldb
    python-pip
    python3-pip
    zsh 
    htop 
    nload 
    
# silversearch-ag
)

declare -a common_repository_profil_list=(
    fonts
    oh-my-zsh
    oh-my-zsh-powerline-theme
    tmux-powerline
)

############################################################
# 创建个人 git 软件仓库目录
############################################################
GIT_HOME="$HOME/gitworkspace"
if [[ ! -d $GIT_HOME ]]; then
    mkdir $GIT_HOME
fi

GIT_REPO_URL="https://github.com/theo-l"

############################################################
# 为每个函数的调用打印一个分割符
############################################################
__sep() {
    echo -e "\n========== $1 ==========\n" 
}

############################################################
# 安装个人偏好所需的 git 软件仓库列表
############################################################
__install_common_repository_profil_list() {

    __sep 'Installing common repository'

    for repo in ${common_repository_profil_list[@]}; do
        if [[ ! -d $GIT_HOME/$repo ]]; then
            printf "Installing the repository: %30s into %50s\n" $repo $GIT_HOME/$repo 
            git clone "$GIT_REPO_URL/${repo}.git" $GIT_HOME/${repo}
        fi
    done
}


############################################################
# 安装个人偏好软件列表
############################################################
__install_common_software_profil_list() {
    __sep "Installing common software"

    for soft in ${common_software_profil_list[@]}; do
        if [[ -z $(which $soft) && -z $(dpkg --list | grep $soft) ]]; then
            printf "Software %-20s not exists, installing it ...\n" "<$soft>"
        
            sudo apt-get install $soft
        else
            printf "Software %-20s already exists...\n" "<$soft>"
        fi
    done

}


############################################################
# 在安装 git 之后配置一些与其相关的全局变量
############################################################
__git_config() {
   __sep "Configuring git " 
    git config --global user.email "theol.liang@gamil.com"
    git config --global user.name "theo-l"
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=7200' #两个小时的有效期
}

############################################################
# python 个人偏好环境相关配置
############################################################
__python_config() {
    __sep "Configuring python" 
    #安装python虚拟环境配置工具
    sudo pip install --upgrade virtualenv
    sudo pip3 install --upgrade virtualenv

    #python 的虚拟环境默认目录为 ~/.virtualenv
    if [[ ! -d ~/.virtualenv ]]; then
        mkdir ~/.virtualenv
    fi

    current_path=$(pwd)

    printf "Current running script directory: %50s\n" $current_path
    #为python2和python3分别创建一个虚拟环境
    cd ~/.virtualenv

    printf "Entered python virtualenv directory: %50s\n" $(pwd)

    if [[ ! -d ./py2 ]]; then
        echo "Virtualenv of python2 not exists, installing it..."
        virtualenv -p python2 py2
    fi

    if [[ ! -d ./py3 ]]; then
        echo "Virtualenv of python3 not exists, installing it..."
        virtualenv -p python3 py3
    fi
    
    cd $current_path
    printf "Returned to current script directory: %50s\n" $(pwd)
    

}


############################################################
# tmux 个人偏好环境相关设置
############################################################
__tmux_config() {
    __sep "Configuring tmux"
    if [[ ! -f ~/.tmux.conf ]]; then
        printf "Coping %50s to %50s\n" ./tmux.config ~
        cp ./tmux.config ~/.tmux.conf
    fi
}


############################################################
# zsh 个人偏好环境设置
############################################################
__zsh_config() {
    
    __sep "Configuring zsh"

    # 如果 oh-my-zsh 插件没有安装到系统中时，需要对其进行安装
    if [[ ! -d ~/.oh-my-zsh ]]; then
        current_path=$(pwd)
        cd "GIT_HOME/oh-my-zsh"
        source ./tools/install.sh
        cd $current_path
    fi

    # 为 zsh 安装 powerline 颜色主题
    if [[ ! -f ~/.oh-my-zsh/custom/themes/powerline.zsh-theme ]]; then
        current_path=$(pwd)
        cd "$GIT_HOME/oh-my-zsh-powerline-theme"
        source ./install_in_omz.sh
        cd $current_path
    fi

    # 将自己个人偏好的 zsh 配置文件拷贝到系统中
    cp ./zshrc ~/.zshrc

}


############################################################
# powerline 字体配置
############################################################
__powerline_font_config() {
    
    # 将 powerline 字体安装到系统中
    source "$GIT_HOME/fonts/install.sh"

    # 刷新系统中的字体
    fc-cache -r
}



__install_common_repository_profil_list
__install_common_software_profil_list
__git_config
__python_config
__tmux_config
__zsh_config
__powerline_font_config

