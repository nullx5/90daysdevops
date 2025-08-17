FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y build-essential
WORKDIR /app
COPY app/hello.c /app/
RUN gcc -o hello hello.c
ENTRYPOINT [ "/app/hello" ]
