#!/usr/bin/env bash

addgroup "${GROUP}" &>/dev/null

useradd -m -d "/home/${USER}" -g "${GROUP}" "${USER}" &>/dev/null

rm -rf "${HOME}/.pyenv" 2>/dev/null && mkdir "${HOME}/.pyenv"

cp -r /root/.pyenv/* "${HOME}/.pyenv"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

pyenv install 3.4.10
pyenv global 3.4.10

cp -r "${HOME}/.pyenv"/* /sync

chown -R "${USER}":"${GROUP}" /sync

exec "$@"
