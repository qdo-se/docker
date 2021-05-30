#!/usr/bin/env bash

addgroup "${GROUP}"

useradd -g "${GROUP}" "${USER}"

cp -r /root/.pyenv/* /data/

chown -R "${USER}":"${GROUP}" /data

exec "$@"
