FROM ubuntu:focal

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip
RUN pip3 install flask

COPY hello.py /tmp/hello.py
EXPOSE 5000

CMD ["python3","/tmp/hello.py"]
