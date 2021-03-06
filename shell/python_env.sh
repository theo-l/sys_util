#!/bin/bash

############################################################
#Python 相关的系统环境配置
############################################################

# PyCharm IDE path 
export PATH=$PATH:$SOFTWARE_HOME/pycharm/bin

# 每次打开终端时进入到python2的虚拟环境中
#source ~/.virtualenv/py2/bin/activate

# pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
