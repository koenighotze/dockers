docker run --name web -v $HOME/content:/usr/share/nginx/html:ro   -p 8080:80 -d koenighotze/simple-nginx
