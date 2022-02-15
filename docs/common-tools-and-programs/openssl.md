# OpenSSL

*   extract public key:
    `openssl rsa -in <key.pem> -pubout > <public.pem>`

*   extract private key:
    `openssl pkey -inform PEM -outform PEM -in <key.pem> -out <private.pem>`

*   encrypt with public key:
    `openssl rsautl -encrypt -inkey <key> -pubin -in <file.txt> -out <file.ssl>`

*   decrypt with private key:
    `openssl rsautl -decrypt -inkey <private.pem> -in <encrypted.ssl> -out <decrypted.txt>`

*   generate key pair: `openssl genrsa -out <key.pem> 2048`

*   sign:
    `openssl dgst --sha256 -sign <key.pem> -out <sign.sha256> <file.txt>`

*   verify signature:
    `openssl dgst --sha256 -verify <public.pem> -signature <sign-sha256> <file.txt>`

*   extract public key from certificate:
    `openssl x509 -in <cert.ctr> -pubkey -noout > <public.pem>`

*   convert binary signature to base64:
    `openssl enc -base64 -in <sign-sha256> -out <sign-sha256.base64>`

*   encrypt with password:
    `openssl enc -aes-256-cbc -in <text.txt> -out <encrypted> -k <pass.txt>`

*   decrypt with password:
    `openssl enc -d aes-256-cbc -in <encrypted> -out <decrypted.txt> -k <pass.txt>`
