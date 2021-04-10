FROM alpine

RUN addgroup -S my-group &&  adduser --disabled-password -S my-user -G my-group

RUN mkdir /data && touch /data/x

RUN chown -R my-user:my-group /data

VOLUME /data /my-volume
