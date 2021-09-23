# Go

* easy way to compile and run on file changes: `nodemon --exec go run main.go --signal SIGTERM`
* access private repositories: `export GOPRIVATE=repo-name`

## go cli

* create go module project: `go mod init <name>`
* add dependency to `go.mod`: `go get <lib-name>`
* clean `go.mod` file, add used dependncies, remove unused dependencies:
`go mod tidy`
* download all dependencies from  `go.mod`: `go get ./...` 
* clean go cache: `go clean -cache -modcache -i -r`
* list library versions: `go list -m -versions <lib-name>`