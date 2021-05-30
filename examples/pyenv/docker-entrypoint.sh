#!/usr/bin/env bash

addgroup "${GROUP}"

useradd -m -d "/home/${USER}" -g "${GROUP}" "${USER}"

curl https://pyenv.run | bash \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.bashrc" \
    && echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME/.bashrc" \
    && echo 'eval "$(pyenv init --path)"' >> "$HOME/.bashrc"

# Run like an interactive shell since .bashrc ignores non-interactive commands
/bin/bash -ic "source $HOME/.bashrc && pyenv install 3.4.10 && pyenv global 3.4.10"

cp -r "$HOME"/.pyenv/* /data/

chown -R "${USER}":"${GROUP}" /data

exec "$@"
