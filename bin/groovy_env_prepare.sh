#!/bin/bash

#dowload gvm
curl -s get.gvmtool.net | bash

#
source $HOME/.gvm/bin/gvm-init.sh

# install latest version
gvm install groovy

