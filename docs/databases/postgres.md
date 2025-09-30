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
	id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
  user_id integer,
	created_on TIMESTAMP NOT NULL,
  last_login TIMESTAMP ,
  FOREIGN KEY (user_id) REFERENCES user (id)
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
* add primary key column to existing table
  * modern versions of postgresql: `ALTER TABLE test1 ADD COLUMN id SERIAL PRIMARY KEY;`
  * older versions of postgresql:
```
ALTER TABLE test1 ADD COLUMN id INTEGER;
CREATE SEQUENCE test_id_seq OWNED BY test1.id;
ALTER TABLE test1 ALTER COLUMN id SET DEFAULT nextval('test_id_seq');
UPDATE test1 SET id = nextval('test_id_seq');
```

* add column to existing table:
```
ALTER TABLE table_name
ADD COLUMN column_name data_type;
```

* function for trigger example:
```
CREATE OR REPLACE FUNCTION function_name()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

declare
v_variable bigint;
begin

IF ( TG_OP = 'DELETE' ) THEN
  v_variable=OLD.column_name;
ELSE
  v_variable=NEW.column_name;
END IF;


perform pg_notify('channel', data)
from table t
where t.column_name = v_variable;

RETURN NULL;
end $function$
;
```

* create trigger:
```
CREATE TRIGGER trigger_name
AFTER INSERT OR UPDATE ON tabel_name
FOR EACH ROW EXECUTE FUNCTION function_name;
```

* check triggers:
``` 
SELECT 
   p.proname as function_name, 
   t.tgname as trigger_name, 
   t.tgenabled as trigger_enabled, 
   t.tgisinternal as is_internal_trigger, 
   c.relname as table_name, 
   n.nspname as schema_name
FROM 
   pg_trigger t
JOIN 
   pg_class c ON t.tgrelid = c.oid 
JOIN 
   pg_proc p ON t.tgfoid = p.oid 
JOIN 
   pg_namespace n ON c.relnamespace = n.oid;
```
## Sequence
```
CREATE SEQUENCE schema.id_seq;

ALTER TABLE schema.table 
ALTER COLUMN column SET DEFAULT nextval('schema.id_seq');
```
* restart sequence: `ALTER SEQUENCE sequence_name RESTART WITH desired_value;`

## System administration
* table `pg_catalog.pg_stat_activity` has the current queries to the database
* function `pg_catalog.pg_cancel_backend(pid integer)` deletes a query based on it's pid


## Postgres docker

### Backup Database

generate sql:

*   docker exec -t your-db-container pg\_dumpall -c -U your-db-user >
    dump\_$(date +%Y-%m-%d\_%H\_%M\_%S).sql to reduce the size of the
    sql you can generate a compress:

*   docker exec -t your-db-container pg\_dumpall -c -U your-db-user |
    gzip > ./dump\_$(date +\`\`%Y-%m-%d\_%H\_%M\_%S'').gz

### Restore Database

*   `cat your_dump.sql | docker exec -i your-db-container psql -U your-db-user -d your-db-name` 

* restore a compressed sql:
    ```
    gunzip your_dump.sql.gz | docker exec -i your-db-container
    psql -U your-db-user -d y`ur-db-name
    ```
## Check 

## Misc

* migrate from sqlite to postgres: `pgloader sqlite://path_to_database.sqlite postgresql://username:password@localhost:5432/database_name`
