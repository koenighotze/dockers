FROM alpine:3.3

MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2016-04-7

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apk add --update wget git vim unzip bash 
RUN apk --update add --virtual build-dependencies wget ca-certificates
RUN apk add --update erlang erlang-crypto erlang-syntax-tools openrc  erlang-ssl erlang-inets
RUN apk add --update  erlang-dev erlang-ssl erlang-inets erlang-dev \
    erlang-edoc erlang-eunit erlang-tools erlang-common-test \
    erlang-public-key  erlang-inets erlang-ssl erlang-asn1 \
    erlang-parsetools
RUN adduser elixir -h /home/elixir -s /bin/bash -D
RUN chmod +s /bin/busybox

ENV ELIXIR_VERSION 1.3.0
RUN wget https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip
RUN mkdir -p /opt/elixir${ELIXIR_VERSION}/
RUN unzip Precompiled.zip -d /opt/elixir${ELIXIR_VERSION}/
RUN ln -s /opt/elixir${ELIXIR_VERSION}/ /opt/elixir
ENV PATH $PATH:/opt/elixir/bin

USER elixir
WORKDIR /home/elixir/
RUN mix local.hex

USER root
RUN rm -rf /etc/ssl && \
    rm -rf /var/cache/apk/*
USER elixir
# setup volume for sharing scripts
ENV SCRIPTS_VOLUME $HOME/src

VOLUME [$SCRIPTS_VOLUME, $HOME/.mix, $HOME/.npm, $HOME/.hex]

# Run REPL
CMD ["iex"]
