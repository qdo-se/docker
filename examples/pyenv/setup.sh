#!/usr/bin/env bash

# set -e

# rm -rf "${HOME}/.pyenv" 2>/dev/null && mkdir "${HOME}/.pyenv"

# docker container run -e "GROUP=$(id -gn)" -e "USER=${USER}" -e "HOME=${HOME}" --mount type=bind,source="${HOME}/.pyenv",destination=/sync quangdo/pyenv:3.4.10 

if ! grep -q 'export PYENV_ROOT="${HOME}/.pyenv"' "${HOME}/.profile"; then
    echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> "${HOME}/.profile"
fi

if ! grep -q 'export PATH="${PYENV_ROOT}/bin:${PATH}"' "${HOME}/.profile"; then
    echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> "${HOME}/.profile"
fi

if ! grep -q 'eval "$(pyenv init --path)"' "${HOME}/.profile"; then
    echo 'eval "$(pyenv init --path)"' >> "${HOME}/.profile"
fi

source "${HOME}/.profile"

pyenv rehash

exec "${SHELL}"
