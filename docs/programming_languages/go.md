# Go

* easy way to compile and run on file changes: `nodemon -e go --exec go run main.go --signal SIGTERM`
* access private repositories: `export GOPRIVATE=repo-name`

## go cli

* create go module project: `go mod init <name>`
* add dependency to `go.mod`: `go get <lib-name>`
* clean `go.mod` file, add used dependncies, remove unused dependencies:
`go mod tidy`
* download all dependencies from  `go.mod`: `go get ./...` 
* clean go cache: `go clean -cache -modcache -i -r`
* list library versions: `go list -m -versions <lib-name>`

## tips
* never use pointer semantics during construction, use value semantics instead:
```
// bad
p := &person{
    name: "bill",
}
functionName(p)

// good
p := person{
    name: "bill",
}
functionName(&p)
```
* for buillt-in types and reference types (map, slices, etc) use always values
semantics

* cross compile to windows: `GOOS=windows GOARCH=amd64 go build main.go`
* to debug in mac m1 compile with the following envirable variables: `GOOS=darwin, GOARCH=arm64`