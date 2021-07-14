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
