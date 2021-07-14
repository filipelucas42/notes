# Solr

create fields in schema:

    curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"name", "type":"text_general", "multiValued":false, "stored":true}}' http://localhost:8983/solr/<solr_core>/schema

add copy field:
`curl -X POST -H 'Content-type:application/json' --data-binary '{"add-copy-field" : {"source":"*","dest":"text"}}' http://localhost:8983/solr/films/schema`

delete all xml: `<delete><query>*:*</query></delete>`

solr directories:
```
    <solr-home-directory>/
       solr.xml
       core_name1/
          core.properties
          conf/
             solrconfig.xml
             managed-schema
          data/
       core_name2/
          core.properties
          conf/
             solrconfig.xml
             managed-schema
          data/
```
schema.xml structure:

```
    <schema>
      <types>
      <fields>
      <uniqueKey>
      <copyField>
    </schema>
```