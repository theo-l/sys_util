#!/bin/bash
set -eu

############################################################
# 安装个人常用的实用软件列表
# 各个软件工具的个人偏好配置
############################################################

declare -a common_software_profil_list=(
#    vim 
#    vim-gnome 
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
    curl
    
# silversearch-ag
)

declare -a common_repository_profil_list=(
    fonts
    vim
    oh-my-zsh
    oh-my-zsh-powerline-theme
    tmux-powerline
)
GIT_HOME=~/gitworkspace
GIT_REPO_URL="https://github.com/theo-l"
UTIL_HOME=$(python -c "import os; print os.path.dirname(os.path.abspath('$0'))")
UTIL_CONFIG_HOME=$UTIL_HOME/config
SHELL_HOME=$UTIL_HOME/shell
SHELL_PATH_HOME=$UTIL_HOME/bin
install_command="sudo apt-get install"


if [[ ! -d $GIT_HOME ]]; then
    mkdir $GIT_HOME
fi


__sep() {
    echo -e "\n========== $1 ==========\n" 
}




__install_common_repository_profil_list() {

    __sep 'Installing common repository'

    for repo in ${common_repository_profil_list[@]}; do
        if [[ ! -d $GIT_HOME/$repo ]]; then
            printf "Installing the repository: %30s into %50s\n" $repo $GIT_HOME/$repo 
            git clone "$GIT_REPO_URL/${repo}.git" $GIT_HOME/${repo}
        else
            current_path=$(pwd)
            cd $GIT_HOME/$repo
            git fetch origin; git pull origin master
            cd $current_path
        fi
    done
}




__install_common_software_profil_list() {
    __sep "Installing common software"

    for soft in ${common_software_profil_list[@]}; do
        if [[ -z $(which $soft) && -z $(dpkg --list | grep $soft) ]]; then
            printf "Software %-20s not exists, installing it ...\n" "<$soft>"
        
            $install_command $soft
        else
            printf "Software %-20s already exists...\n" "<$soft>"
        fi
    done

}




__git_config() {
   __sep "Configuring git " 
    git config --global user.email "theol.liang@gamil.com"
    git config --global user.name "theo-l"
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=7200' #两个小时的有效期
}





__python_config() {
    __sep "Configuring python" 
    #安装python虚拟环境配置工具
    if [[ ! -z $(pip list | grep virtualenv) ]]; then
        echo "virtualenv already exists"
    else
        sudo pip install --upgrade virtualenv
        sudo pip3 install --upgrade virtualenv
    fi

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






__tmux_config() {
    __sep "Configuring tmux"
    if [[ ! -f ~/.tmux.conf ]]; then
        printf "Coping %50s to %50s\n" ./tmux.config ~
        cp $UTIL_CONFIG_HOME/tmux.config ~/.tmux.conf
    fi
}






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

    if [[ ! "$(tail -n 1 $UTIL_CONFIG_HOME/zshrc)"  =~ .*shell_startup.sh$ ]]; then
        echo "source $SHELL_HOME/shell_startup.sh" >> ./config/zshrc
    fi

    # 将自己个人偏好的 zsh 配置文件拷贝到系统中
    cp $UTIL_CONFIG_HOME/zshrc ~/.zshrc
    

}





__powerline_font_config() {
    
    __sep "Configuring powerline font"

    current_path=$(pwd)

    if [[ -z $(ls ~/.local/share/fonts | grep powerline) ]]; then
        echo -e "\nInstalling powerline fonts\n"        

        # 将 powerline 字体安装到系统中
        source "$GIT_HOME/fonts/install.sh"

        # 刷新系统中的字体
        fc-cache -r
    else
        echo -e "Powerline fonts already installed\n"
    fi

    cd $current_path
}






__vim_config() {
    
    __sep "Configuring Vim"

    current_path=$(pwd)

#    cd $GIT_HOME/vim
#    ./configure --with-features=huge \
#            --enable-multibyte \
#            --enable-rubyinterp \
#            --enable-pythoninterp \
#            --with-python-config-dir=/usr/lib/python2.7/config \
#            --enable-python3interp \
#            --with-python3-config-dir=/usr/lib/python3.5/config \
#            --enable-perlinterp \
#            --enable-luainterp \
#            --enable-cscope --prefix=/usr
#    make VIMRUNTIMEDIR=/usr/share/vim/vim80; sudo make install




    if [[ ! -d ~/.vim ]]; then
        cp -r $UTIL_HOME/vim ~/.vim
    fi

    if [[ ! -f ~/.vimrc ]]; then
        cp $UTIL_CONFIG_HOME/vimrc ~/.vimrc
    fi

    vim +PlugInstall

    cd $current_path
    
}



__install_common_repository_profil_list
__install_common_software_profil_list
__git_config
__python_config
__tmux_config
__zsh_config
__powerline_font_config
__vim_config
