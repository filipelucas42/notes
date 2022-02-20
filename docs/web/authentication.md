# Authentication

## Basic authentication
* uses http header `Authorization` with the keyword `Basic`
* the `user` and `password` are concatenated with `:` like this `user:pass` and then converted to base64 `user:pass` -> `dXNlcjpwYXNz`
* http header example: `Authorization: Basic dXNlcjpwYXNz`

## Bearer token
* uses http header `Authorization` with the keyword `Bearer`
* http example: `Authorization: Bearer some_value`

## JWT
{JSON standard fields}.{Custom fields}.signature