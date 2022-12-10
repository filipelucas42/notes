# linux

## file system
* /bin: executable programs (home of core utils programas), usually symbolic linked with `/usr/bin`
* /boot: files needed by bootloader, contains initial rams files and kernel
* /dev: contains device files
* /etc: contains configuration files
* /home: location of individual users home directories
* /lib: contains shared libraries
* /lost+found: place where broken files reside after a system crash
* /media: mount point for removable media
* /mnt: for mount devices temporarily (sometimes systems mount devices permanently here)
* /opt: optional packages
* /proc: contains information abaout every process, each proces has a subdirectory (use `cat /proc/cpuinfo` to see cpu information)
* /root: home directory for `root` user
* /run: information about system since boot time like who is logged in and which daemons are running
* /sbin: contains executable programs, usually symbolic linked with `/usr/bin`
* /srv: ocasionaly used to serve files with a webserver or files with ftp
* /sys: information about drivers, devices and kernel features on the system
* /tmp: directory for temporary files
* /usr: contains executable programs
* /var: system specific variable files like logs, temporary message files


run `man hier` to see information about file system
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
* ignore keyprint: `ssh -o "StrictHostKeyChecking=no" <url>`
* ssh key permissions: `chmod 400 ~/.ssh/key.pem`
* connect using ssh keypair: `ssh -i key.pem <user>@<hostname>`
* create ssh key: `ssh-keygen -t ed25519 -C "your_email@example.com"`
* adding ssh key to ssh agent: `eval "$(ssh-agent -s)"`
* disable password authentication: adding the following line to file `/etc/ssh/sshd_config`
```
PasswordAuthentication no
```


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
* check path of pid: `pwdx 38555`

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

* backup files:
```
#!/usr/bin/bash
source /home/ubuntu/.bash_profile
backup_date=$(date +%F) && tar cvfz /home/ubuntu/dokuwiki-backups/$(echo $backup_date).tar.gz /var/www/dokuwiki/data /var/www/dokuwiki/conf && aws s3 cp /home/ubuntu/dokuwiki-backups/$(echo $backup_date).tar.gz s3://bucket_name
```
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

* check log: `grep CRON /var/log/syslog`
* basic usage: `a b c d e /directory/command output`
  * a - minute
  * b - hour
  * c - day
  * d - month
  * e - day of the week

By default, cron sends an email to the owner of the crontab file when it runst, to 
turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.

## misc

http benchmark: `ab -c 100 -n 10000 http://127.0.0.1:8080/api/`
