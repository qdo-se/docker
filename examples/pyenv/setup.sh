#!/usr/bin/env bash

set -e

rm -rf "${HOME}/.pyenv" 2>/dev/null && mkdir "${HOME}/.pyenv"

docker container run -e "GROUP=$(id -gn)" -e "USER=${USER}" -e "HOME=${HOME}" --mount type=bind,source="${HOME}/.pyenv",destination=/data quangdo/pyenv:3.4.10

if ! grep -q 'export PYENV_ROOT="${HOME}/.pyenv"' "$HOME/.bashrc"; then
    echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> "$HOME/.bashrc"
fi

if ! grep -q 'export PATH="${PYENV_ROOT}/bin:${PATH}"' "$HOME/.bashrc"; then
    echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> "$HOME/.bashrc"
fi

if ! grep -q 'eval "$(pyenv init --path)"' "$HOME/.bashrc"; then
    echo 'eval "$(pyenv init --path)"' >> "$HOME/.bashrc"
fi

source "$HOME/.bashrc"

pyenv rehash
