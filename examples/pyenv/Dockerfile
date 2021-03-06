FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive \
  TZ=US

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  software-properties-common \
  git \
  rsync \
  sudo \
  make \
  build-essential \
  curl \
  wget \
  vim \
  python3 \
  python3-pip \
  && apt-get -y autoremove \
  && apt-get clean autoclean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# python 3.4.10 dependencies
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu bionic-security main" \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  libssl1.0-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  llvm \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libffi-dev \
  liblzma-dev

RUN curl https://pyenv.run | bash
  # && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.bashrc" \
  # && echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME/.bashrc" \
  # && echo 'eval "$(pyenv init --path)"' >> "$HOME/.bashrc"

# Run like an interactive shell since .bashrc ignores non-interactive commands
# RUN ["/bin/bash", "-ic", "source $HOME/.bashrc && pyenv install 3.4.10 && pyenv global 3.4.10"]

RUN mkdir -p /sync

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
