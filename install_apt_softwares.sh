#!/usr/bin/env bash

sudo apt-get install $(grep -v '^#' apt-requirements.txt)
