#!/usr/bin/env python

"""
@summary:
helper script to initialize database.
Implements:
- create database
- create role
- create schema
"""


import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import re
import os
import io
import sys
import datetime
import argparse
import pandas


##################################
# argument parser helpers

cli = argparse.ArgumentParser()
subparsers = cli.add_subparsers(dest="subcommand")

def subcommand(args=[], parent=subparsers):
    args.extend([
        argument("-H", "--server", action="store", help="database server name/ip address", default=os.getenv('DB_HOST')),
        argument("-P", "--port", action="store", help="database server port", default=os.getenv('DB_PORT', 5432)),
        argument("-D", "--database", action="store", help="database name", default=os.getenv('DB', 'coveo')),
        argument("-u", "--user", action="store", help="database user", default=os.getenv('SECRET_USERNAME')),
        argument("-p", "--password", action = "store", help="database password", default = os.getenv('SECRET_PASSWORD')),
    ])
    def decorator(func):
        parser = parent.add_parser(func.__name__, description=func.__doc__)
        for arg in args:
            parser.add_argument(*arg[0], **arg[1])
        parser.set_defaults(func=func)
    return decorator

def argument(*name_or_flags, **kwargs):
    return ([*name_or_flags], kwargs)



##################################
# implemented functionalities

def exec_autocommit(args, sql):
    c = psycopg2.connect(
        host = args.server,
        port = args.port,
        user = args.user,
        password = args.password,
    )
    c.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    C = c.cursor()
    C.execute(sql)
    C.close()
    c.close()

def exec_commit(args, sql):
    c = psycopg2.connect(
        host = args.server,
        port = args.port,
        user = args.user,
        password = args.password,
        database = args.database,
    )
    C = c.cursor()
    C.execute(sql)
    c.commit()
    C.close()
    c.close()


@subcommand([])
def create_database(args):
    sql = "CREATE DATABASE {}".format(args.database)
    exec_autocommit(args, sql)


@subcommand([])
def drop_database(args):
    sql = "DROP DATABASE {}".format(args.database)
    exec_autocommit(args, sql)


@subcommand([
    argument("-R", "--role", action="store", help="role", required=True),
    argument("-r", "--role_pw", action="store", help="role's password", required=True),
    argument("-c", "--grant_create", action="store_true", help="grant write rule"),
])
def create_role(args):
    g = f"GRANT CREATE ON DATABASE {args.database} TO {args.role};" if args.grant_create else ""
    sql = f"""
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = '{args.role}') THEN

      CREATE ROLE {args.role} LOGIN PASSWORD '{args.role_pw}' NOINHERIT;
   END IF;
END
$do$;
GRANT CONNECT ON DATABASE {args.database} TO {args.role};
{g}
"""
    exec_commit(args, sql)


@subcommand([ argument("-R", "--role", action="store", help="role to drop", required=True) ])
def drop_role(args):
    sql = f"""
DROP OWNED BY {args.role};
DROP ROLE {args.role};
    """
    exec_commit(args, sql)


@subcommand([argument("-S", "--schema", action="store", help="schema name", required=True)])
def create_schema(args):
    sql = f"""
CREATE SCHEMA {args.schema};
REVOKE ALL ON SCHEMA {args.schema} FROM PUBLIC;
    """
    exec_commit(args, sql)


@subcommand([argument("-S", "--schema", action="store", help="schema name", required=True)])
def drop_schema(args):
    sql = "DROP SCHEMA {} CASCADE".format(args.schema)
    exec_commit(args, sql)


#FIXME:
##@subcommand([
##    argument("-S", "--schema", action="store", help="schema name", required=True),
##    argument("-R", "--role", action="store", help="read write role", required=True),
###    argument("-r", "--role_readonly", action="store", help="read only role", required=True),
##])
##def grant_role(args):
##    sql = f"""
#####     GRANT USAGE ON SCHEMA datahub_0 TO public_reader;
##-- GRANT ALL ON SCHEMA {args.schema} TO {args.role};
##GRANT USAGE ON SCHEMA {args.schema} TO {args.role};
##ALTER ROLE {args.role} SET search_path={args.schema};
##ALTER ROLE {args.role_readonly} SET search_path={args.schema};
##ALTER DEFAULT PRIVILEGES FOR USER {args.role} IN SCHEMA {args.schema} GRANT ALL PRIVILEGES ON TABLES TO {args.role};
##ALTER DEFAULT PRIVILEGES FOR USER {args.role} IN SCHEMA {args.schema} GRANT SELECT ON TABLES TO {args.role_readonly};
##    """
##    exec_commit(args, sql)


@subcommand([argument("-S", "--schema", action="store", help="schema name", required=True)])
def create_types(args):
    from schema import enum_types
    _j = lambda i: "', '".join(i)
    _r = lambda x: f"CREATE TYPE {args.schema}.{x[0]} AS ENUM ('{_j(x[1])}')"
    sql = ';\n'.join([ _r(x) for x in enum_types.items() ])
    exec_commit(args, sql)


@subcommand([
    argument("-S", "--schema", action="store", help="schema name", required=True),
    argument("-L", "--load_tables", action="store", help="when creating load tables, this is the prefix", required=False),
])
def create_tables(args):
    from schema import tables_common, tables_load
    if args.load_tables:
        sql = tables_load.format(schema = args.schema, prefix = args.load_tables)
    else:
        sql = tables_common.format(schema = args.schema)
    exec_commit(args, sql)


@subcommand([argument("-S", "--schema", action="store", help="schema name", required=True)])
def create_functions(args):
    schema = args.schema
    sql = f"""
CREATE OR REPLACE FUNCTION {schema}.lookup_annotation(key integer, gene_name {schema}.type_genename)
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$
    SELECT CONCAT_WS('&', (
      SELECT CAST(annotation_atom AS VARCHAR(64))
        FROM {schema}.annotation_binding
        WHERE key = key AND gene_name = gene_name
        ))
       $function$
;
CREATE OR REPLACE FUNCTION {schema}.convert_list_aa(VARIADIC list text[])
 RETURNS TABLE(hgvs_p character varying)
 LANGUAGE plpgsql
AS $function$
DECLARE
    res text;
    str text;
BEGIN
    FOREACH str IN ARRAY list
    LOOP
      SELECT convert_single_aa(str) INTO res;
      hgvs_p := res;
      RETURN NEXT;
    END LOOP;
END; $function$
;
CREATE OR REPLACE FUNCTION {schema}.convert_single_aa_list(VARIADIC list text[])
 RETURNS text[]
 LANGUAGE plpgsql
AS $function$
DECLARE 
   results text[];
   res text;
   str text;
BEGIN
     FOREACH str IN ARRAY list
     loop
        select convert_single_aa(str) into res;
        results := array_append(results, res);
    end loop;
    return results;
END;
$function$
;
CREATE OR REPLACE FUNCTION {schema}.convert_single_aa_list_test(VARIADIC list text[])
 RETURNS TABLE(hgvs_p character varying)
 LANGUAGE plpgsql
AS $function$
DECLARE
    res text;
    str text;
BEGIN
    FOREACH str IN ARRAY list
    LOOP
      SELECT convert_single_aa(str) INTO res;
      hgvs_p := res;
      RETURN NEXT;
    END LOOP;
END; $function$
;
CREATE OR REPLACE FUNCTION {schema}.convert_single_aa_protein_pairs_list(VARIADIC list text[])
 RETURNS TABLE(gene_name text, hgvs_p text)
 LANGUAGE plpgsql
AS $function$
DECLARE 
    res text;
    str text;
    tmp text[];
BEGIN
    FOREACH str IN ARRAY list
    LOOP
      tmp := regexp_split_to_array(str, ':');
      SELECT convert_single_aa(tmp[2]) INTO res;
      hgvs_p := res;
      gene_name := tmp[1];
      RETURN NEXT;
    END LOOP;
END; $function$
;
CREATE OR REPLACE FUNCTION {schema}.convert_single_aa(character)
 RETURNS character
 LANGUAGE sql
AS $function$
    WITH aa_left_three AS (
      SELECT symbol_3letter
      FROM {schema}.amino_acid_symbol
      WHERE symbol_1letter=(SELECT LEFT($1, 1) AS ExtractString)
      )
   , aa_right_three AS (
      SELECT symbol_3letter
      FROM {schema}.amino_acid_symbol
      WHERE symbol_1letter=(SELECT RIGHT($1, 1) AS ExtractString)
      )
   , left_replaced AS (
      SELECT REPLACE($1,
              (SELECT LEFT($1, 1) AS ExtractString),
              (SELECT CONCAT('p.',
                            (SELECT * FROM aa_left_three)))))
   SELECT REPLACE((SELECT * FROM left_replaced),
              (SELECT RIGHT($1, 1) AS ExtractString),
              (SELECT * FROM aa_right_three));
$function$
;
CREATE OR REPLACE FUNCTION {schema}.host_human_id()
 RETURNS INT
 LANGUAGE plpgsql
AS $function$
DECLARE r INT;
BEGIN
 SELECT host.id INTO r
   FROM {schema}.host
   WHERE host.host::text = 'Homo sapiens'::text;
 RETURN r;
END; 
$function$
    """
    exec_commit(args, sql)


@subcommand([
    argument("-S", "--schema", action="store", help="schema name", required=True),
    argument("-T", "--path_to_tables", action="store", help="path to tsv table files", default="./data/")
])
def populate_tables(args):
    datafile = lambda t: os.path.join(args.path_to_tables, f't_{t}.tsv')

    c = psycopg2.connect(
        host = args.server,
        port = args.port,
        user = args.user,
        password = args.password,
        database = args.database,
    )
    C = c.cursor()
    schema = args.schema

    for t in ['country', 'collector', 'host', 'instrument', 'library', 'lineage_def', 'amino_acid_symbol', 'primer_artic_v3', 'primer_artic_v4', 'pcr_primers', 'lamp_primers']:
        with open(datafile(t)) as f:
            f.readline()
            C.copy_expert(f"COPY {schema}.{t} FROM STDIN WITH (format csv, delimiter '\t')", f)

    c.commit()
    C.close()
    c.close()


@subcommand([argument("-S", "--schema", action="store", help="schema name", required=True)])
def create_views(args):
    from schema import views
    sql = views.format(schema = args.schema)
    exec_commit(args, sql)


@subcommand([argument("-S", "--schema", action="store", help="schema name", required=True)])
def create_materialized_views(args):
    from schema import materialized_views
    sql = materialized_views.format(schema = args.schema)
    exec_commit(args, sql)


@subcommand([argument("-S", "--schema", action="store", help="schema name", required=True)])
def create_indexes(args):
    from schema import indexes
    sql = indexes.format(schema = args.schema)
    exec_commit(args, sql)


if __name__ == "__main__":
    args = cli.parse_args()
    if args.subcommand is None:
        cli.print_help()
    else:
        args.func(args)


