# linux

## common commands

### ls:
*   list file in human readable format: `ls -lh`

### ln
*   create link: `ln -s <file> <link>`

### tar
*   extract file.tar.xz: `tar -xf <file.tar.xz>`

*   compress files: `tar -cfzv files.tar.gz file1 file2 file3 …​`

### bc (calculator)
* define decimal places: `scale=2`

### ssh
*   copy public key to server: `ssh-copy-id demo@198.51.100.0`

### dig
*   check domain ip: `dig <url> +short`

## other commands
*   Certbot with nginx:
    `sudo certbot --standalone certonly -d example.com --pre-hook "service nginx stop" --post-hook "service nginx start"`

## tips

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
* enale sudo for user without asking for password:

put at the end of file `/etc/surdoers`: `username     ALL=(ALL) NOPASSWD:ALL`

*   add group: `groupadd <new_group>`

*   add user to group `usermod -a -G <group_name> <username>`

*   file persmission:

```
# u for user, g for group, o for others
# r for read, w for write, x for execute
chmod ugo+rwx <foldername>
```
