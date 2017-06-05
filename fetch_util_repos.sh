#!/bin/bash

GIT_HOME=~/gitworkspace
GIT_REPO_HOST="https://github.com/theo-l/"

if [[ ! -d $GIT_HOME ]]; then
    mkdir $GIT_HOME
fi

typeset -a util_repos

# personally most used repos which fork on my github account
util_repos=(
    fonts
)


__install_util_repos() {
    
    for repo in ${util_repos[@]}; do
       if [[ ! -d $GIT_HOME/$repo ]]; then
           printf "Installing the repository: %30s" $repo
           git clone "${GIT_REPO_HOST}{$repo}.git" $GIT_HOME/${repo}
       else
            printf "Repository %20s already exists!" "<$repo>"
       fi 
    done
}


__install_util_repos
