#!/bin/bash
set -eu

ssh -oHostKeyAlgorithms=+ssh-dss admin@192.168.0.11 -p 50490
