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

RUN mkdir /data

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
