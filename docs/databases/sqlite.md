# sqlite

create table:
```
CREATE TABLE child ( 
    id           INTEGER PRIMARY KEY, 
    parent_id    INTEGER, 
    description  TEXT,
    FOREIGN KEY (parent_id) REFERENCES parent(id)
);
```

* make backup: `sqlite3 /path/to/db '.backup /path/to/backup'`