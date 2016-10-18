#!/bin/bash
#script used to specify shutdown actions

_sep() {
    echo -e "\n========== $1 ==========\n" 
}

_update_git_remote_repos() {
    _sep "Updating project at shutdown" 

    for pro in $(find ${PROJECT_HOME}  -maxdepth 1 -type d); do
        printf "Updating project: %-s\n" $pro
        cd $pro
        git add -A ; git commit -m 'push by shutdown'; git push origin master;
    done
}


_restore_local_data() {
    _sep "Removing shell started file flag"
    if [[ -f $SHELL_HOME/started ]]; then
        rm $SHELL_HOME/started
    fi
}


_turnoff() {
    _sep "Turn off computer"
    sudo shutdown -h 0;
}

_update_git_remote_repos


_restore_local_data

_turnoff
