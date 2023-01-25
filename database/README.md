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
#! /bin/bash

SRV=postgres-kooplex-staging
DB_NAME=kooplex_ebi
ADMIN=postgres
ADMIN_PW=
LOADER=public_loader
LOADER_PW=
READER=public_reader
READER_PW=

SCHEMA_NAME=datahub_0


python3 init_db.py create_database -u ${ADMIN} -p ${ADMIN_PW} -H ${SRV} -D ${DB_NAME}
python3 init_db.py create_role -u ${ADMIN} -p ${ADMIN_PW} -H ${SRV} -D ${DB_NAME} -R ${LOADER} -r ${LOADER_PW} -c
python3 init_db.py create_role -u ${ADMIN} -p ${ADMIN_PW} -H ${SRV} -D ${DB_NAME} -R ${READER} -r ${READER_PW}
python3 init_db.py create_schema -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
#python3 init_db.py grant_role -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -R ${READER} -S ${SCHEMA_NAME}
python3 init_db.py create_types -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
python3 init_db.py create_tables -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
python3 init_db.py create_functions -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
python3 init_db.py create_views -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
python3 init_db.py create_indexes -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
python3 init_db.py create_materialized_views -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
python3 init_db.py populate_tables -u ${LOADER} -p ${LOADER_PW} -H ${SRV} -D ${DB_NAME} -S ${SCHEMA_NAME}
```

# Insert or append new data in th edatabase

It requres a tarbal including gzipped coverage and annotated vcf files for a set of new samples. Three steps are involved in the procedure. a) the creation of load tables, b) loading the data in the database and c) merging of data including refreshing materialized views.

Shell script variales are the same as described above and
* `SRC`: a path to the input tarbal
* `SNAPSHOT`: a label to the set of samples
* `BATCHES`: how many input files to process in the source folder
* `LOAD_PREFIX`: new data is inserted in load tables, which follow this prefix prescrition

```bash
#! /bin/bash

SRV=postgres-kooplex-staging
DB_NAME=kooplex_ebi
LOADER=public_loader
LOADER_PW=
SCHEMA_NAME=datahub_0

SRC=/mnt/archive/2023-01-09
BATCHES=40
SNAPSHOT=2023_01_09
LOAD_PREFIX=load_230109

L=${SCHEMA_NAME}.${SNAPSHOT}
mkdir ${L}

python3 init_db.py create_tables --server ${SRV} --user ${LOADER} --password ${LOADER_PW} --database ${DB_NAME} --schema ${SCHEMA_NAME} --load_tables ${LOAD_PREFIX}

for i in $(seq 1 ${BATCHES}) ; do
  python3 ebi_vcf.py \
    --input ${SRC}/batch-${i}.tar.gz \
    --server ${SRV} \
    --user ${LOADER} --password ${LOADER_PW} \
    --database ${DB_NAME} --schema ${SCHEMA_NAME} \
    --snapshot ${SNAPSHOT}-snap-${i} \
    --runid_table_name runid \
    --vcf_table_name ${LOAD_PREFIX}_vcf --vcfkey_table_name ${LOAD_PREFIX}_vcf_key \
    --vcfkey_table_name_readonly vcf_key \
    --vcfunique_table_name ${LOAD_PREFIX}_unique_vcf \
    --vcfannotation_table_name ${LOAD_PREFIX}_annotation \
    --vcflof_table_name ${LOAD_PREFIX}_vcf_lof --annotation_binding ${LOAD_PREFIX}_annotation_binding > ${L}/vcf-${i}.log 2>&1
                
  python3 ebi_cov.py \
    --input ${SRC}/batch-${i}.tar.gz \
    --server ${SRV} \
    --user ${LOADER} --password ${LOADER_PW} \
    --database ${DB_NAME} --schema ${SCHEMA_NAME} \
    --snapshot ${SNAPSHOT}-snap-${i} \
    --runid_table_name runid \
    --cov_table_name ${LOAD_PREFIX}_cov --covunique_table_name ${LOAD_PREFIX}_unique_cov > ${L}/cov-${i}.log 2>&1
done
```
