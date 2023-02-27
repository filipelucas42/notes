# migration tools

## flyway
https://flywaydb.org/

* config file `flyway.conf`:
```
flyway.url=jdbc:postgresql://localhost:5432/postgres
flyway.user=postgres
flyway.password=postgres
```
* Put migration sql file inside folder `sql` with the following naming convention:
```
V000__migration_name.sql
V001__migration_name.sql
...
```
* Run migrations: `flyway migrate`
  * Run with docker: `docker run --network=host --rm -v ${PWD}/sql:/flyway/sql -v ${PWD}/conf:/flyway/conf flyway/flyway migrate`
 
