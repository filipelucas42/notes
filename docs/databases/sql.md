# sql

create table:
```
CREATE TABLE table_name (
    id          bigint not null primary key,
    value       varchar(255) not null,
);
```

create table if not exists:
```
CREATE TABLE IF NOT EXISTS table_name (
    id          bigint not null primary key,
    value       varchar(255) not null,
);
```

insert:
```
INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...); 
```

update:
```
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

change database name:
```
ALTER TABLE table_name
RENAME TO new_table_name;
```

drop table: `DROP TABLE table_name;`

delete: `DELETE from table_name where <conditions>`