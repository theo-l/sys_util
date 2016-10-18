#!/bin/bash
set -eu

#update system softwares
sudo apt-get update; sudo apt-get upgrade;

#after update system should reinstall to avoid system frozen
# sudo apt-get install --reinstall xserver-xorg-input-all;
