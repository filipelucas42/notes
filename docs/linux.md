# Linux

*   list file in human readable format: `ls -lh`

*   Create link: `ln -s <file> <link>`

*   Extract file.tar.xz: `tar -xf <file.tar.xz>`

*   compress files: `tar -cfzv files.tar.gz file1 file2 file3 …​`

*   Copy public key to server: `ssh-copy-id demo@198.51.100.0`

*   Certbot with nginx:
    `sudo certbot --standalone certonly -d example.com --pre-hook "service nginx stop" --post-hook "service nginx start"`

*   Turn on case insensitive by adding the following line to
    `/etc/inputrc`: `set completion-ignore-case on`

*   Burn iso into usb:

<!-- -->

    sudo umoutn /dev/sdx
    sudo dd bs=4M if=<iso path> of=/dev/sdx

*   find and replace string:
    `find . -type f ! -path "./node_modules/{star}" ! -path "./.git/{star}" -exec sed -i "s/{underscore}{underscore}model/{underscore}model/g" {} +`

*   upgrade linux:

<!-- -->

    sudo apt install update-manager-core
    sudo do-release-upgrade

*   calculator: `bc`

    -   define decimal places: `scale=2`

*   indentify groff macro: `grog -t <file>`

*   generate pdf example:
    `groff -man -t <file> | pstopdf -i -o <file.pdf>`

*   add group: `groupadd <new_group>`

*   add user to group `usermod -a -G <group_name> <username>`

*   file persmission:

<!-- -->

    # u for user, g for group, o for others
    # r for read, w for write, x for execute
    chmod ugo+rwx <foldername>

*   check pid using port: `lsof -i :8983`

*   check open ports: `netstat -plnt`

*   solve .pem files bad permission: `chmod 400 mykey.pem`

*   variable that has the exit code from last command: `pg_isready`

*   check domain ip: `dig <url> +short`

<!-- -->

    cat /etc/ssl/dummy.crt /etc/ssl/dummy.key > /etc/ssl/dummy.pem

*   convert file format with pandoc:
    `pandoc -t <target_format> -f <original_format> <file>`

## Journal with Unix

Write on .bash\_profile:

    alias journal='file="/Users/filipeines/journal/$(date +"%Y-%m-%d").txt";if [[ -f $file ]]; then vim $file ;else echo "# $(date +"%Y-%m-%d")" > $file; vim $file; fi'
