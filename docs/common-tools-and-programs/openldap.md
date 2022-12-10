# OpenLDAP

* install: `sudo apt install slapd`
* start: `sudo systemctl start slapd`
* reconfigure: `sudo dpkg-reconfigure slapd`
* openldap info: `slapcat`
* add entry: `ldapadd -D cn=admin,dc=domain,dc=com -x -W -f path/file.ldif`
* add group example ldif:
```
dn: ou=people,dc=filipelucas,dc=com
objectClass: top
objectClass: organizationalUnit
ou: people
```
* add user example ldif:
```
dn: uid=joe,ou=people,dc=filipelucas,dc=com
objectClass: inetOrgPerson
cn: first name
sn: lastname
uid: joe
userPassword: password
```