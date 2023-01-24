# Misc

## Semantica version (semver)

examples: `2.0.0` `2.0.0-rc.2` `2.0.0-rc.1` `1.0.0` `1.0.0-beta`

Given a version number MAJOR.MINOR.PATCH, increment the:

1.  MAJOR version when you make incompatible API changes,

2.  MINOR version when you add functionality in a backwards compatible
    manner, and

3.  PATCH version when you make backwards compatible bug fixes.

Additional labels for pre-release and build metadata are available as
extensions to the MAJOR.MINOR.PATCH format.

nodemon usage example:
`nodemon --exec "go run main.go" --signal SIGTERM -e go,html`

## ip's for documentation

According with [RFC 5737](https://tools.ietf.org/html/rfc5737)
the following ip's should be used for documentation:

* 192.0.2.1
* 198.51.100.1
* 203.0.113.1

ip ranges:
* 192.0.2.0/24
* 198.51.100.0/24
* 203.0.113.0/24

ipv6:
* 2001:db8::
* 2001:db8:ffff:ffff:ffff:ffff:ffff:ffff
* 2001:db8:1:1:1:1:1:1
* 2001:db8:2:2:2:2:2:2
* 2001:db8:3:3:3:3:3:3
* 2001:db8:4:4:4:4:4:4

ipv6 range:
* 2001:db8::/32


