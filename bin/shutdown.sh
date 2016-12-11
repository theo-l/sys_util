#!/bin/bash

_sep() {
    echo -e "\n========== $1 ==========\n"
}

_update_git_remote_repos() {
    _sep "Updating project at shutdown"

    for pro in $(find ${PROJECT_HOME}  -maxdepth 1 -type d); do
        if [[ $(basename $pro) == 'jco_backend_python' || $(basename $pro) == 'dangyuan_python' ]]; then
            printf "Working dir dont update automatically"
            continue
        fi 
        cd $pro
        if [[ -d ./.git ]]; then
            if [[ -z $(git status| grep "nothing") ]]; then
                printf "Updating project: %-s\n" $pro
                git add -A ; git commit -m 'push by shutdown'; git push origin master;
            fi
        fi
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
