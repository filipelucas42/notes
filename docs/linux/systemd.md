# SystemD

## service definition example:

```
# /etc/systemd/system/service_name.service
[Unit]
Description=service name
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=user
ExecStart=/path/to/bin
```