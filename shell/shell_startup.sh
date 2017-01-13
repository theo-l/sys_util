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

source $SHELL_HOME/shell_env.sh
source $SHELL_HOME/java_env.sh
source $SHELL_HOME/python_env.sh
source $SHELL_HOME/django_env.sh
source $SHELL_HOME/shell_alias.sh
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh





__updating_local_repositories() {
    _sep "Updating local repositories"

    for repo in $(find ${PROJECT_HOME}  -maxdepth 1 -type d); do
        printf "\nUpdating local repository: ==={%-s}\n" $repo
        cd $repo

        #过滤掉非 git 目录
        if [[ ! -d ./.git ]]; then
            continue
        else
            git fetch origin; git pull origin master;
        fi
    done
}


_start_shell() {

    _debug "starting up..."    

    if [[ ! -f $SHELL_HOME/started ]]; then
    
        touch $SHELL_HOME/started 
        __updating_local_repositories
        
        cd ~
        #TODO
        # MORE STARTUP ACTIONS ADD here
    
    else
        _debug "Shell already started"
    fi
}


############################## 启动个人偏好的Shell相关设置 ##############################
_start_shell


