docker run -d --name guest2 -v ~/dev/docker/loadbalance/guest2:/usr/share/nginx/html:ro   -p 8082:80 -d koenighotze/simple-nginx
