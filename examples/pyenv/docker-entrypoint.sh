#!/usr/bin/env bash

addgroup "${GROUP}" &>/dev/null

useradd -m -d "/home/${USER}" -g "${GROUP}" "${USER}" &>/dev/null

rm -rf "/home/${USER}/.pyenv" 2>/dev/null && mkdir "/home/${USER}/.pyenv"

cp -r /root/.pyenv/* "/home/${USER}/.pyenv"

export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init --path)"

pyenv install 3.4.10
pyenv global 3.4.10

cp -r "/home/${USER}/.pyenv"/* /sync

chown -R "${USER}":"${GROUP}" /sync

exec "$@"
