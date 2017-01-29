#!/usr/bin/env bash

sudo apt-get install $(grep -v '^#' requirements-apt.txt)
