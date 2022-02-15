# linux

## common commands

### ls:
*   list file in human readable format: `ls -lh`

### ln
*   create link: `ln -s <file> <link>`

### grep
* search word inside folder: `grep -rnw '/path/to/somewhere/' -e 'pattern'`
  * `-r` recursive
  * `-n` line number
  * `-w` whole word

### tar
* extract file.tar.xz: `tar -xf <file.tar.xz>`

* extract file.tar.xz to directry: `tar -xf <file.tar.xz> -C /path/to/directory`

* compress files: `tar cfzv files.tar.gz file1 file2 file3 …​`

### bc (calculator)
* define decimal places: `scale=2`

### ssh
* copy public key to server: `ssh-copy-id demo@198.51.100.0`
<<<<<<< HEAD
* ignore keyprint: `ssh -o "StrictHostKeyChecking=no" <url>`
* ssh key permissions: `chmod 400 ~/.ssh/key.pem`
* connect using ssh keypair: `ssh -i key.pem <user>@<hostname>
=======
* ignore keyprint: `ssh -o <url>`
>>>>>>> d186d7e (m)

### dig
*   check domain ip: `dig <url> +short`

### find
* find files with extension: `find . -type f -name "*.txt"`


## other commands
*   Certbot with nginx:
    `sudo certbot --standalone certonly -d example.com --pre-hook "service nginx stop" --post-hook "service nginx start"`

## tips
* print file strucuture: `find . | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/| - \1/"`
*   check pid using port: `lsof -i :8983`

*   check open ports: `netstat -plnt`

*   solve .pem files bad permission: `chmod 400 mykey.pem`

*   convert file format with pandoc:
    `pandoc -t <target_format> -f <original_format> <file>`

*   turn on case insensitive by adding the following line to
    `/etc/inputrc`: `set completion-ignore-case on`

*   find and replace string:
    `find . -type f ! -path "./node_modules/{star}" ! -path "./.git/{star}" -exec sed -i "s/{underscore}{underscore}model/{underscore}model/g" {} +`


*   indentify groff macro: `grog -t <file>`

*   generate pdf example:
    `groff -man -t <file> | pstopdf -i -o <file.pdf>`

## files/user management
* to enable sudo for user without asking for password, put at this line 
the end of file `/etc/surdoers`: `username     ALL=(ALL) NOPASSWD:ALL`

* create group: `groupadd <new_group>`

* add user to group `usermod -a -G <group_name> <username>`
* list groups: `cat /etc/group`
*   file persmission:

```
# u for user, g for group, o for others
# r for read, w for write, x for execute
chmod ugo+rwx <foldername>
```

## toubleshooting

* socat permission: `setcap 'cap_net_bind_service=+ep' /usr/bin/socat`

## cronjobs

check log: `grep CRON /var/log/syslog`

## misc

http benchmark: `ab -c 100 -n 10000 http://127.0.0.1:8080/api/`
