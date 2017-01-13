#!/bin/bash
set -eu

sftp -oHostKeyAlgorithms=+ssh-dss -P 50490 admin@192.168.0.11 
