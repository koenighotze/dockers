FROM gliderlabs/alpine:3.3

MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2015-09-15

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apk-install wget git postgresql elixir vim unzip bash erlang-crypto erlang-syntax-tools openrc
RUN adduser elixir -h /home/elixir -s /bin/bash -D

USER elixir
WORKDIR /home/elixir/
RUN wget -nv https://github.com/koenighotze/talks-elixir-intro/archive/master.zip && unzip -q master.zip && rm master.zip
RUN wget -nv https://github.com/phoenixframework/phoenix/archive/master.zip && unzip -q master.zip && rm master.zip
RUN wget -nv https://github.com/elixir-lang/elixir/archive/master.zip && unzip -q master.zip && rm master.zip
RUN mix local.hex
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# prepare postgres db for phoenix usage
# USER postgres
# ADD prepare_postgresql.sql .
# RUN /etc/init.d/postgresql start
# RUN psql -f prepare_postgresql.sql
# USER root

# setup volume for sharing scripts
ENV SCRIPTS_VOLUME $HOME/src

VOLUME [$SCRIPTS_VOLUME]

# Run REPL
CMD ["iex"]
