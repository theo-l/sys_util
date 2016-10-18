#!/bin/bash


############################################################
#定义个人偏好的命令别名列表
############################################################
##########  基本命令别名
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias llh="ls -lh"
alias updatesys="sudo apt-get update; sudo apt-get upgrade;"
alias fs="fc -s"

########## tmux 命令别名
alias tmuxns="tmux -2 new -s"

##########  vim 命令别名
alias gvim="vim -g"

########## git 命令别名
alias gita="git add"
alias gitaa="git add -A"
alias gitbranch="git branch"
alias gitchk="git checkout"
alias gitcmt="git commit -m"
alias gitpso="git push origin master"
alias gitplo="git pull origin master"
alias gitfo="git fetch origin"

##########  通用目录进入别名: 在此可以定义任意其他的目录进入别名
alias cddwn="cd $DOWNLOAD_HOME"
alias cddoc="cd $DOCUMENT_HOME"
alias cddes="cd $HOME/Desktop"
alias cdvid="cd $VIDEO_HOME"
alias cdmus="cd $MUSIC_HOME"
alias cdpic="cd PICTURE_HOME"
alias cdgit="cd $GIT_HOME"
alias cdprj="cd $PROJECT_HOME"
alias cdwk="cd $WORKSPACE_HOME"
alias cdsh="cd $SHELL_HOME"

alias cd2py="cd $PYTHON_ENV_HOME/py2"
alias cd3py="cd $PYTHON_ENV_HOME/py3"

alias rmd="rm -rf"

############################################################


