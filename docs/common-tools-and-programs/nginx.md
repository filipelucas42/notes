# nginx

## config for dokuwiki

```
server {
    listen               80;
    listen                   [::]:80;
    server_name          wiki.domain.example;
    return 301 https://$server_name$request_uri;
}
 
server {
    listen [::]:443 ssl;
    listen 443 ssl;
 
    server_name wiki.domain.example;
 
    # Maximum file upload size is 4MB - change accordingly if needed
    client_max_body_size 4M;
    client_body_buffer_size 128k;
 
    root /dokuwiki;
    index doku.php;
 
    #Remember to comment the below out when you're installing, and uncomment it when done.
    location ~ /(conf/|bin/|inc/|install.php) { deny all; }
 
    #Support for X-Accel-Redirect
    location ~ ^/data/ { internal ; }
 
    location ~ ^/lib.*\.(js|css|gif|png|ico|jpg|jpeg)$ {
        expires 365d;
    }
 
    location / { try_files $uri $uri/ @dokuwiki; }
 
    location @dokuwiki {
        # rewrites "doku.php/" out of the URLs if you set the userwrite setting to .htaccess in dokuwiki config page
        rewrite ^/_media/(.*) /lib/exe/fetch.php?media=$1 last;
        rewrite ^/_detail/(.*) /lib/exe/detail.php?media=$1 last;
        rewrite ^/_export/([^/]+)/(.*) /doku.php?do=export_$1&id=$2 last;
        rewrite ^/(.*) /doku.php?id=$1&$args last;
    }
 
    location ~ \.php$ {
        try_files $uri $uri/ /doku.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param REDIRECT_STATUS 200;
        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        # fastcgi_pass unix:/var/run/php5-fpm.sock; #old php version
    }
}
```
