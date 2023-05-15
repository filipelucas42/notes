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

### gpg
* create key:
```
gpg --batch --generate-key <<EOF
  %no-protection
  Key-Type: default
  Subkey-Type: default
  Name-Real: Foo Bar
  Expire-Date: 0
EOF
```

* list keys: `gpg --list-keys`
* export public key: `gpg --output public.gpg --armor --export key_id`
* export private key: `gpg --output private.gpg --armor --export-secret-key key_id`

### dig
*   check domain ip: `dig <url> +short`

### find
* find files with extension: `find . -type f -name "*.txt"`

### date
* `date +FORMAT`
```
FORMAT controls the output.  Interpreted sequences are:

%%     a literal %
%a     locale's abbreviated weekday name (e.g., Sun)
%A     locale's full weekday name (e.g., Sunday)
%b     locale's abbreviated month name (e.g., Jan)
%B     locale's full month name (e.g., January)
%c     locale's date and time (e.g., Thu Mar  3 23:05:25 2005)
%C     century; like %Y, except omit last two digits (e.g., 20)
%d     day of month (e.g., 01)
%D     date; same as %m/%d/%y
%e     day of month, space padded; same as %_d
%F     full date; like %+4Y-%m-%d
%g     last two digits of year of ISO week number (see %G)
%G     year of ISO week number (see %V); normally useful only
      with %V
%h     same as %b
%H     hour (00..23)
%I     hour (01..12)
%j     day of year (001..366)
%k     hour, space padded ( 0..23); same as %_H
%l     hour, space padded ( 1..12); same as %_I
%m     month (01..12)
%M     minute (00..59)
%n     a newline
%N     nanoseconds (000000000..999999999)
%p     locale's equivalent of either AM or PM; blank if not known
%P     like %p, but lower case
%q     quarter of year (1..4)
%r     locale's 12-hour clock time (e.g., 11:11:04 PM)
%R     24-hour hour and minute; same as %H:%M
%s     seconds since the Epoch (1970-01-01 00:00 UTC)
%S     second (00..60)
%t     a tab
%T     time; same as %H:%M:%S
%u     day of week (1..7); 1 is Monday
%U     week number of year, with Sunday as first day of week
      (00..53)
%V     ISO week number, with Monday as first day of week (01..53)
%w     day of week (0..6); 0 is Sunday
%W     week number of year, with Monday as first day of week
      (00..53)
%x     locale's date representation (e.g., 12/31/99)
%X     locale's time representation (e.g., 23:13:48)
%y     last two digits of year (00..99)
%Y     year
%z     +hhmm numeric time zone (e.g., -0400)
%:z    +hh:mm numeric time zone (e.g., -04:00)
%::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)
%:::z  numeric time zone with : to necessary precision (e.g.,
      -04, +05:30)
%Z     alphabetic time zone abbreviation (e.g., EDT)
```

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
* fix mta error: `sudo apt install postfix`
  * check output message: `tail -f /var/mail/<user>`

## misc

* http benchmark: `ab -c 100 -n 10000 http://127.0.0.1:8080/api/`
* check linux distro: `cat /etc/os-release`
* youtube-dl download mp3 format: `youtube-dl -x --audio-format mp3 <url>`
  * alternative to youtube-dl: `yt-dl`
* sshuttle: `sshuttle --dns -vvr username@sshserver 0/0`
* edit pdf files (cut pages): `pdftk input.pdf cat 2-4 output out1.pdf`
* convert date to epoch: `date -d "05/15/1993 15:21:22" +"%s"`

