#!/bin/bash
set -eu

if [[ -f ./manage.py  ]]; then
./manage.py makemigrations
fi
