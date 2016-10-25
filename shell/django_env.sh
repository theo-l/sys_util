#!/bin/bash

if [[ -f $(pwd)/.manager.py ]]; then
    echo 'manager.py exist'
fi

typeset -a django_cmds
django_cmds=(

    #[django command]
    check
    compilemessages
    createcachetable
    dbshell
    diffsettings
    dumpdata
    flush
    inspectdb
    loaddata
    makemessages
    makemigrations
    migrate
    runserver
    sendtestemail
    shell
    showmigrations
    sqlflush
    sqlmigrate
    sqlsequencereset
    squashmigrations
    startapp
    test
    testserver
#   using with django-admin  
#   startproject

#    [django.contrib.auth]
    createsuperuser
    changepassword

#    [django.contrib.gis]
    ogrinspect

#    [django.contrib.sessions]
    clearsessions

#    [django.contrib.sitemaps]
    ping_google

#    [django.contrib.staticfiles]
    collectstatic
    findstatic

    reset
    runfcgi
    sql
    sqlall
    sqlclear
    sqlcustom
    sqlindexex
    sqlreset
    syncdb
    validate
    cleanup

)

run_django() {

    if [[ -z ${1} ]]; then
        return
    fi

    if [[ ! -f ./manage.py ]]; then
        echo -e "===Your are not in a django project dir==="
        return
    fi

    ./manage.py $@
}

# 手动创建 django 的相关命令
django_alias() {
    
    for cmd in ${django_cmds}; do
        alias dj_$cmd="run_django $cmd"
    done

}

django_admin_alias() {
   alias dj_project="django-admin startproject" 
}

django_alias
django_admin_alias


