FROM alpine

RUN addgroup -S my-group &&  adduser --disabled-password -S my-user -G my-group

RUN mkdir /data && echo 'x' > /data/x

RUN chown -R my-user:my-group /data

VOLUME /data

RUN echo 'y' > /data/y
