# PHP

* check ini file: `php --ini`

* regex: `preg_match ( string $pattern , string $subject , array &$matches === null , int $flags === 0 , int $offset === 0 ) : int|false`

* hash password: `$hash = password_hash("admin", PASSWORD_DEFAULT);`
* suppress warning messages: `error_reporting(E_ERROR | E_PARSE);`
* install common packages: `sudo apt install php-common php-curl php-json php-mbstring php-mysql php-xml php-zip php-sqlite3 php-gd php-bcmath`

## composer
* install lib: `composer require symfony/http-kernel`
* uninstall lib: `composer remove vendor/package`