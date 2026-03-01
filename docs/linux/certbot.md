# certbot

* install: `sudo apt install python3-certbot-nginx`
* issue certificate: `sudo certbot --nginx -d example.com`
* standalone with nginx: `sudo certbot --standalone certonly -d example.com --pre-hook "service nginx stop" --post-hook "service nginx start"`
