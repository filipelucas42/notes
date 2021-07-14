# Postgres

*   start postgres server: `sudo systemctl start postgres`

*   Enter posgres prompt: `sudo -u postgres psql`

*   List users: `\du`

*   Create user: `create user newuser with password 'password';`

*   Change user password:
    `alter user username with password 'new_password';`

*   Create database: `create database database_name;`

*   Grant all privileges:
    `grant all privileges on database database_name to user;`

*   Check where is hba file: `show hba_file;`

*   Connect to database: `\c`

*   List tables: `\dt`

*   Import SQL file: `psql databasename < data_base_dump`

*   export database: `pg_dump -U username dbname > dbexport.pgsql`

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
