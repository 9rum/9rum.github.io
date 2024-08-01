FROM ubuntu:22.04

ENV LC_ALL=C.UTF-8

WORKDIR /workspace

COPY . .

RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential ruby-dev ruby-bundler nodejs && \
    apt autopurge && \
    apt autoremove && \
    apt autoclean && \
    bundle install

ENTRYPOINT ["jekyll", "serve", "--incremental"]
