#!/bin/bash

repos=( ~/gitworkspace/.notes ~/gitworkspace/.dotfiles ~/gitworkspace/.blog ~/gitworkspace/.doc)

for repo in ${repos[@]}; do
    echo -e "\n---------updating in repository $repo-------\n"
    cd $repo
    git fetch origin 
    git pull origin master 
done


