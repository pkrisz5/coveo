# Initialize a schema (database namespace)

Make sure to set properly the shell variables:
* `SRV`: points to the database server address
* `DB_NAME`: database name
* `SCHEMA_NAME`: the name of the schame to be created
* `LOADER`: the name of the data loader user (role) to be created
* `LOADER_PW`: the password of the data loader user to be set
* `READER`: the name of the read only user (role) to be created
* `READER_PW`: the password of the read only user to be set

Database administrator credentials can be set via environment variables:
* `SECRET_USERNAME`: the name of the database administrator
* `SECRET_PASSWORD`: the password of the database administrator


```bash
SRV=postgres-kooplex-staging
DB_NAME=kooplex_ebi
SCHEMA_NAME=datahub_0
LOADER=public_loader
LOADER_PW=
READER=public_reader
READER_PW=

# create the schema, connecting to database as database administrator
python3 init_db.py create_schema -S ${SCHEMA_NAME} -H ${SRV} -D ${DB_NAME}
# create and set roles of the data loader and the read only users
python3 init_db.py grant_role -S ${SCHEMA_NAME} -H ${SRV} -D ${DB_NAME} -R ${READER} -r ${READER_PW} -W ${LOADER} -w ${LOADER_PW}
# create types, tables, views, materialized views and procedures, connecting to database as the data loader user
python3 init_db.py populate_schema_structure -S ${SCHEMA_NAME} -H ${SRV} -D ${DB_NAME} -u ${LOADER} -p ${LOADER_PW}
# prepopulate constant tables with data
python3 init_db.py populate_tables -S ${SCHEMA_NAME} -H ${SRV} -D ${DB_NAME} -u ${LOADER} -p ${LOADER_PW}
```
