FROM alpine

RUN addgroup -S my-group &&  adduser --disabled-password -S my-user -G my-group

COPY entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["echo", "Call command"]
