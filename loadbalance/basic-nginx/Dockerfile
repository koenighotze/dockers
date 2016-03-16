FROM nginx:alpine

COPY nginx.basic.conf /etc/nginx/nginx.conf

RUN mkdir -p /tmp/logs/nginx/
VOLUME ["/usr/share/nginx/html", "/etc/", "/tmp/logs/nginx/"]
