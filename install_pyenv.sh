#!/usr/bin/env bash

# clone the repository into local home
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# write the env into shell env
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshenv
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshenv

# init pyenv env when start shell env
echo 'eval "$(pyenv init -)"' >> ~/.zshenv
