#!/bin/bash
set -eu


#used to list all running process count in the system

sudo lsof -U | wc -l
