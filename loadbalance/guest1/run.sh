docker run -d --name guest1 -v ~/dev/docker/loadbalance/guest1:/usr/share/nginx/html:ro   -p 8081:80 -d koenighotze/simple-nginx
