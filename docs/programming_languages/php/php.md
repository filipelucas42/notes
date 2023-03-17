# PHP

* check ini file: `php --ini`

* regex: `preg_match ( string $pattern , string $subject , array &$matches === null , int $flags === 0 , int $offset === 0 ) : int|false`

* hash password: `$hash = password_hash("admin", PASSWORD_DEFAULT);`
* suppress warning messages: `error_reporting(E_ERROR | E_PARSE);`
* install common packages: `sudo apt install php-common php-curl php-json php-mbstring php-mysql php-xml php-zip php-sqlite3 php-gd php-bcmath`
* turn on types: `declare(strict_types=1)`

## composer
* install lib: `composer require symfony/http-kernel`
* uninstall lib: `composer remove vendor/package`
* docker: `docker run --rm --volume $PWD:/app --user $(id -u):$(id -g) composer <command>`

## docker
* run php server inside docker:
	* docker run --rm -it -p 8080:8080 -v $PWD:/code php sh
	* cd /code
	* php -S 0.0.0.0:8080
