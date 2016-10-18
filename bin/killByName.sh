#!/bin/bash
# kill some process by program name

pname=$1

echo "kill process $pname"
pgrep $pname | xargs kill
