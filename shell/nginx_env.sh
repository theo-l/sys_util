#!/bin/bash
set -eu

typeset -a nginx_signals
nginx_signals=(
   stop
   quit
   reload
   reopen
)

# create nginx signal alias
nginx_signals_alias() {

    for signal in ${nginx_signals}; do
        alias nginx_$signal="sudo nginx -s $signal"
    done
}

nginx_signals_alias

set +eu


