#!/bin/bash
DEBUG=0

_debug() {
    if [[ $DEBUG == 1 ]]; then
        echo -e "\n----DEBUG:$1----\n"
    fi
}


_sep() {
    echo -e "\n========== $1 ==========\n" 
}


# $ZSH is set on zsh 
# $BASH is set on bash
# $version is set on tcsh
# $shell is set on csh or tcsh
if [[ ! -z $BASH ]]; then
    export SHELL_HOME=$(cd ${BASH_SOURCE[0]%/*} && pwd )
elif [[ ! -z $ZSH_NAME ]]; then
    export SHELL_HOME=$(dirname $0)
fi

#export SHELL_HOME=$(dirname "$(readlink -f $0)")
export SHELL_PATH_HOME=$(dirname $SHELL_HOME)/bin
export PATH=$PATH:$SHELL_PATH_HOME

_debug $SHELL_HOME

# 启用一系列环境配置文件

source $SHELL_HOME/shell_env.sh
source $SHELL_HOME/java_env.sh
source $SHELL_HOME/python_env.sh
source $SHELL_HOME/django_env.sh
source $SHELL_HOME/shell_alias.sh
#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
source $SHELL_HOME/git_env.sh
source $SHELL_HOME/nginx_env.sh
source $SHELL_HOME/shell_options.sh
# start virtualenvwrapper
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

