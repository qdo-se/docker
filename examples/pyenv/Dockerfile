FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive \
  TZ=US

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  software-properties-common \
  git \
  gnupg \
  openssh-client \
  openssh-server \
  python3 \
  python3-pip \
  python3-setuptools \
  rsync \
  sudo \
  make \
  build-essential \
  curl \
  wget \
  vim \
  && apt-get -y autoremove \
  && apt-get clean autoclean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
  && ln -s /usr/bin/python3 /usr/bin/python \
  && pip3 install --upgrade pip \
  && pip3 install wheel setuptools


RUN curl https://pyenv.run | bash \
  && exec $SHELL \
  && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.bashrc" \
  && echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME/.bashrc" \
  && echo 'eval "$(pyenv init --path)"' >> "$HOME/.bashrc"


RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu bionic-security main" \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  libssl1.0-dev \
  zlib1g-dev

RUN pyenv install 3.4.10
