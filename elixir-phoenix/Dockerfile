FROM koenighotze/elixir
MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2016-05-20

USER root 

RUN apk add --update nodejs
RUN apk add  postgresql-client
RUN apk add openssh
RUN apk add  ca-certificates
RUN apk --update upgrade &&     apk add curl ca-certificates &&     update-ca-certificates &&     rm -rf /var/cache/apk/*
RUN npm install -g brunch

USER elixir
WORKDIR /home/elixir/
RUN mix local.hex
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

#USER root
RUN npm install --save-dev babel-preset-es2015

#USER elixir 
RUN git clone https://github.com/phoenixframework/phoenix.git phoenix-src

# setup volume for sharing scripts
ENV SCRIPTS_VOLUME $HOME/src

VOLUME [$SCRIPTS_VOLUME, $HOME/.mix, $HOME/.npm, $HOME/.hex]

EXPOSE 4000
# Run REPL
CMD ["iex"]
