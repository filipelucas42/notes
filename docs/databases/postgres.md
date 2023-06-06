# Postgres

* install on ubuntu: `sudo apt install postgresql postgresql-contrib`
* connect to database: `psql -d <database_name> -h <host> -U <user>`

* start postgres server: `sudo systemctl start postgres`

* Enter postgres prompt: `sudo -u postgres psql`
* Enter postgres prompt in macos: `sudo -u <username> psql postgres`

* List users: `\du`

* Create user: `create user newuser with password 'password';`

* Change user password:
  `alter user username with password 'new_password';`

* Create database: `create database database_name;`

* Grant all privileges:
  `grant all privileges on database database_name to user;`

* grant privileges to schema: `GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA schema_name TO username;`
* Check where is hba file: `show hba_file;`

* Connect to database: `\c`

* List tables: `\dt`

* Import SQL file: `psql databasename < data_base_dump`

* export database: `pg_dump -U username dbname > dbexport.pgsql`

* create table example:
```
CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);
```

* alter table to add on delete cascade:
```
ALTER TABLE "Children"
DROP CONSTRAINT "Children_parentId_fkey",
ADD CONSTRAINT "Children_parentId_fkey"
  FOREIGN KEY ("parentId")
  REFERENCES "Parent"(id)
  ON DELETE CASCADE;
```

* rename column: `alter table "user" rename column user_id to id;`
* delete function: `DROP FUNCTION [ IF EXISTS ] function_name ( [ argument_data_type [, ...] ] );`
## Postgres docker

### Backup Database

generate sql:

*   docker exec -t your-db-container pg\_dumpall -c -U your-db-user >
    dump\_$(date +%Y-%m-%d\_%H\_%M\_%S).sql to reduce the size of the
    sql you can generate a compress:

*   docker exec -t your-db-container pg\_dumpall -c -U your-db-user |
    gzip > ./dump\_$(date +\`\`%Y-%m-%d\_%H\_%M\_%S'').gz

#### Restore Database

*   `cat your_dump.sql | docker exec -i your-db-container psql -U your-db-user -d your-db-name` 

* restore a compressed sql:
    ```
    gunzip your_dump.sql.gz | docker exec -i your-db-container
    psql -U your-db-user -d y`ur-db-name
    ```
