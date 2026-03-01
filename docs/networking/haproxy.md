# haproxy

configuration for redis fallback:
```
defaults REDIS
 mode tcp
 timeout connect  4s
 timeout server  30s
 timeout client  30s
frontend ft_redis
 bind 127.0.0.1:6379 name redis
 default_backend bk_redis
backend bk_redis
 option tcp-check
 tcp-check send PING\r\n
 tcp-check expect string +PONG
 tcp-check send QUIT\r\n
 tcp-check expect string +OK
 server R1 127.0.0.1:7001 check inter 5s rise 3 fall 2
 server R2 127.0.0.1:7002 backup check inter 5s rise 3 fall 2
```