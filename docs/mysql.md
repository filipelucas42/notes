# mysql

## list databases

`show databases`

## list users

`select user from mysql.user`

## create user

`CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';`

## create database

`CREATE DATABASE database_name;`

## grant all privileges

`GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost' with grant option;`

## flush privileges

`flush privileges`

## use password to authenticate

`ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`

## show grants

`show grants for 'arctel_prod'@'localhost';`

## solution to collation error:

`ALTER TABLE parameters_values CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;`

## backup database

`mysqldump <database> > dump.sql`
