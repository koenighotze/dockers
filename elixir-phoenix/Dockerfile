FROM koenighotze/elixir
MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2016-05-20

USER root 

RUN apk add --update nodejs

USER elixir
WORKDIR /home/elixir/
#RUN wget -nv https://github.com/phoenixframework/phoenix/archive/master.zip && unzip -q master.zip && rm master.zip
#RUN wget -nv https://github.com/elixir-lang/elixir/archive/master.zip && unzip -q master.zip && rm master.zip
RUN mix local.hex
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# prepare postgres db for phoenix usage
# USER postgres
# ADD prepare_postgresql.sql .
# RUN /etc/init.d/postgresql start
# RUN psql -f prepare_postgresql.sql

USER elixir
# setup volume for sharing scripts
ENV SCRIPTS_VOLUME $HOME/src

VOLUME [$SCRIPTS_VOLUME]

# Run REPL
CMD ["iex"]
