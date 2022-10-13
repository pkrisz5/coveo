# Initialize a new schema (aka. database namespace)

The new schema initialization involves four steps. a) the creation of the database namespace, b) the creation of users, c) the generation of table structure and d) initialization of constant table content. The following bash snippet helps with these steps.

Make sure to set properly the shell script variables:
* `SRV`: points to the database server address
* `DB_NAME`: database name
* `SCHEMA_NAME`: the name of the schame to be created
* `LOADER`: the name of the data loader user (role) to be created
* `LOADER_PW`: the password of the data loader user to be set
* `READER`: the name of the read only user (role) to be created
* `READER_PW`: the password of the read only user to be set

Database administrator credentials, used in step a) and step b), can be set via environment variables:
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

# Insert or append new data in th edatabase

It requres a tarbal including gzipped coverage and annotated vcf files for a set of new samples. Three steps are involved in the procedure. a) the creation of load tables, b) loading the data in the database and c) merging of data including refreshing materialized views.

Shell script variales are the same as described above and
* `TARBAL`: a path to the input tarbal
* `SNAPSHOT`: a label to the set of samples

```bash
# creation of load tables
python init_db.py create_tables --server ${SRV} --user ${LOADER} --password ${LOADER_PW} --database ${DB_NAME} --schema ${SCHEMA_NAME} --load_tables

# insertion of vcf information
python3 ebi_vcf.py \
    --input ${TARBAL} \
    --server ${SRV} \
    --user ${LOADER} --password ${LOADER_PW} \
    --database ${DB_NAME} --schema ${SCHEMA_NAME} \
    --snapshot ${SNAPSHOT} \
    --runid_table_name runid \
    --vcf_table_name load_summer_vcf --vcfkey_table_name load_summer_vcf_key \
    --vcfkey_table_name_readonly vcf_key \
    --vcfunique_table_name load_summer_unique_vcf \
    --vcfannotation_table_name load_summer_annotation \
    --vcflof_table_name load_summer_vcf_lof --annotation_binding load_summer_annotation_binding

# insertion of coverage information
python3 ebi_cov.py \
    --input ${TARBAL} \
    --server ${SRV} \
    --user ${LOADER} --password ${LOADER_PW} \
    --database ${DB_NAME} --schema ${SCHEMA_NAME} \
    --snapshot ${SNAPSHOT} \
    --runid_table_name runid \
    --cov_table_name load_summer_cov --covunique_table_name load_summer_unique_cov

# merging tables
# TBA.
```
