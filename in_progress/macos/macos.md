# macos

install psycopg on m1:
```
brew install libpq --build-from-source
brew install openssl

export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/libpq/include"

pip3 install psycopg2
```

* change php versions:
```
brew unlink php@7.4
brew link php@5.6 --force
```