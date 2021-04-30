FROM alpine

RUN addgroup -S my-group &&  adduser --disabled-password -S my-user -G my-group

RUN mkdir /tmp/build

COPY . /tmp/build
# VOLUME /my-volume
