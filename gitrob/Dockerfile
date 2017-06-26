FROM ruby:2.4.1-alpine
MAINTAINER koenighotze koenighotze@yahoo.com

RUN apk update
RUN apk add git postgresql-dev alpine-sdk
RUN gem install gitrob

WORKDIR /root/
COPY .gitrobrc /root/.gitrobrc
COPY start_gitrob.sh /root/start_gitrob.sh
RUN chmod +x /root/start_gitrob.sh

RUN curl -O https://raw.githubusercontent.com/Eficode/wait-for/master/wait-for
RUN chmod +x /root/wait-for

EXPOSE 8000

ENTRYPOINT ["/root/start_gitrob.sh"]