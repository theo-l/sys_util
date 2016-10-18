#!/bin/bash

DEBUG=1
_debug() {
    if [[ $DEBUG == 1 ]]; then
        echo -e "\n----DEBUG:$1----\n"
    fi
}


_sep() {
    echo -e "\n========== $1 ==========\n" 
}


###########################################################
# 特定的系统环境变量 导入
###########################################################
export SHELL_HOME=$(python -c "import os; print os.path.dirname(os.path.abspath('$0'))")
export SHELL_PATH_HOME=$(python -c "import os; print os.path.dirname('$SHELL_HOME')")/bin
export PATH=$PATH:$SHELL_PATH_HOME
source $SHELL_HOME/shell_env.sh
source $SHELL_HOME/shell_alias.sh
source $SHELL_HOME/java_env.sh
source $SHELL_HOME/python_env.sh

############################################################
# TEST code
############################################################
_debug $SHELL_HOME
_debug $SHELL_PATH_HOME
_debug $PATH




############################################################
# 更新本地的 github 软件仓库列表
############################################################
updating_local_repositories() {
    _sep "Updating local repositories"
    for repo in $(find ${PROJECT_HOME} -type d -maxdepth 1); do
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



############################################################
# 所有需要执行的动作都会在此逻辑中插入
############################################################
if [[ ! -f $SHELL_HOME/started ]]; then

    echo "starting up..."    
    touch $SHELL_HOME/started 
    updating_local_repositories

    # MORE ACTIONS

else
    echo "Shell already started"
fi
