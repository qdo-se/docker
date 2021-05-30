#!/usr/bin/env bash

addgroup "${GROUP}" &>/dev/null

useradd -g "${GROUP}" "${USER}" &>/dev/null

cp -r /root/.pyenv/* /data/

chown -R "${USER}":"${GROUP}" /data

exec "$@"
