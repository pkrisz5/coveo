--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.6 (Ubuntu 15.6-1.pgdg20.04+1)

-- Started on 2024-03-06 15:07:11 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 24 (class 2615 OID 16391)
-- Name: datahub_0; Type: SCHEMA; Schema: -; Owner: public_loader
--

CREATE SCHEMA datahub_0;


ALTER SCHEMA datahub_0 OWNER TO public_loader;

--
-- TOC entry 1205 (class 1247 OID 16464)
-- Name: type_annotation_atom; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_annotation_atom AS ENUM (
    'missense_variant',
    'conservative_inframe_deletion',
    'synonymous_variant',
    'intergenic_region',
    'frameshift_variant',
    'stop_lost',
    'downstream_gene_variant',
    'conservative_inframe_insertion',
    'disruptive_inframe_insertion',
    'initiator_codon_variant',
    'exon_loss_variant',
    'start_lost',
    'upstream_gene_variant',
    'stop_gained',
    'disruptive_inframe_deletion',
    'intragenic_variant',
    'gene_fusion',
    'splice_region_variant',
    'transcript_ablation',
    'stop_retained_variant',
    'feature_ablation'
);


ALTER TYPE datahub_0.type_annotation_atom OWNER TO public_loader;

--
-- TOC entry 1199 (class 1247 OID 16446)
-- Name: type_annotationimpact; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_annotationimpact AS ENUM (
    'HIGH',
    'MODERATE',
    'LOW',
    'MODIFIER'
);


ALTER TYPE datahub_0.type_annotationimpact OWNER TO public_loader;

--
-- TOC entry 1214 (class 1247 OID 16618)
-- Name: type_featureid; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_featureid AS ENUM (
    'GU280_gp02-GU280_gp03',
    'GU280_gp09',
    'GU280_gp07',
    'GU280_gp05-GU280_gp06',
    'GU280_gp06-GU280_gp07',
    'GU280_gp05',
    'GU280_gp01',
    'GU280_gp10',
    'GU280_gp08-GU280_gp09',
    'GU280_gp08',
    'GU280_gp03-GU280_gp04',
    'GU280_gp01-GU280_gp02',
    'GU280_gp04',
    'GU280_gp10-GU280_gp11',
    'GU280_gp11-CHR_END',
    'CHR_START-GU280_gp01',
    'GU280_gp11',
    'GU280_gp03',
    'GU280_gp09-GU280_gp10',
    'GU280_gp02',
    'GU280_gp06',
    'GU280_gp04-GU280_gp05',
    'YP_009725297.1',
    'YP_009742608.1',
    'GU280_gp01.2',
    'YP_009725298.1',
    'YP_009742609.1',
    'YP_009725299.1',
    'YP_009742610.1',
    'YP_009725300.1',
    'YP_009742611.1',
    'YP_009725301.1',
    'YP_009742612.1',
    'YP_009725302.1',
    'YP_009742613.1',
    'YP_009725303.1',
    'YP_009742614.1',
    'YP_009725304.1',
    'YP_009742615.1',
    'YP_009725305.1',
    'YP_009742616.1',
    'YP_009725306.1',
    'YP_009725307.1',
    'YP_009725308.1',
    'YP_009725309.1',
    'YP_009725310.1',
    'YP_009725311.1',
    'YP_009725312.1',
    'YP_009742617.1'
);


ALTER TYPE datahub_0.type_featureid OWNER TO public_loader;

--
-- TOC entry 1190 (class 1247 OID 16426)
-- Name: type_featuretype; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_featuretype AS ENUM (
    'intergenic_region',
    'transcript',
    'gene_variant'
);


ALTER TYPE datahub_0.type_featuretype OWNER TO public_loader;

--
-- TOC entry 1211 (class 1247 OID 16542)
-- Name: type_genename; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_genename AS ENUM (
    'ORF1ab-S',
    'S',
    'ORF7a',
    'ORF6-ORF7a',
    'M-ORF6',
    'E-M',
    'ORF8-N',
    'ORF7b&ORF8',
    'ORF1ab&S',
    'N',
    'ORF10-CHR_END',
    'ORF1ab',
    'N-ORF10',
    'ORF7a&ORF7b',
    'ORF6',
    'ORF7b',
    'ORF3a',
    'ORF10',
    'ORF3a&S',
    'CHR_START-ORF1ab',
    'S-ORF3a',
    'M&ORF6',
    'ORF3a-E',
    'ORF7b-ORF8',
    'M',
    'ORF6&ORF7a',
    'E',
    'M&ORF7a',
    'ORF8',
    'E&ORF3a',
    'N&ORF8',
    'ORF6&ORF7b',
    'N&ORF10',
    'E&M',
    'ORF7a&ORF8',
    'ORF6&ORF7a&ORF7b&ORF8',
    'ORF6&ORF8',
    'N-N/A',
    'N/A-M',
    'ORF10-N/A',
    'ORF1ab-N/A'
);


ALTER TYPE datahub_0.type_genename OWNER TO public_loader;

--
-- TOC entry 1184 (class 1247 OID 16412)
-- Name: type_integrity; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_integrity AS ENUM (
    'ok',
    'empty file',
    'corrupt file'
);


ALTER TYPE datahub_0.type_integrity OWNER TO public_loader;

--
-- TOC entry 1178 (class 1247 OID 16398)
-- Name: type_layout; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_layout AS ENUM (
    'single',
    'paired'
);


ALTER TYPE datahub_0.type_layout OWNER TO public_loader;

--
-- TOC entry 1208 (class 1247 OID 16508)
-- Name: type_lof; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_lof AS ENUM (
    '(S|GU280_gp02|1|1.00)',
    '(E|GU280_gp04|1|1.00)',
    '(ORF7a|GU280_gp07|1|1.00)',
    '(ORF7b|GU280_gp08|1|1.00)',
    '(ORF10|GU280_gp11|1|1.00)',
    '(ORF1ab|GU280_gp01|1|1.00)',
    '(N|GU280_gp10|1|1.00)',
    '(M|GU280_gp05|1|1.00)',
    '(ORF3a|GU280_gp03|1|1.00)',
    '(ORF8|GU280_gp09|1|1.00)',
    '(ORF6|GU280_gp06|1|1.00)',
    '(ORF1ab|GU280_gp01|28|0.07)',
    '(ORF1ab|GU280_gp01|28|0.11)',
    '(ORF1ab|GU280_gp01|28|0.14)',
    '(ORF1ab|GU280_gp01|28|0.04)',
    '(ORF1ab|GU280_gp01|28|0.18)'
);


ALTER TYPE datahub_0.type_lof OWNER TO public_loader;

--
-- TOC entry 1408 (class 1247 OID 31368)
-- Name: type_method; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_method AS ENUM (
    'Diagnostic-PCR',
    'LAMP',
    'sequencing'
);


ALTER TYPE datahub_0.type_method OWNER TO public_loader;

--
-- TOC entry 1187 (class 1247 OID 16420)
-- Name: type_nmd; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_nmd AS ENUM (
    '(ORF1ab|GU280_gp01|1|1.00)',
    '(ORF1ab|GU280_gp01|28|0.04)'
);


ALTER TYPE datahub_0.type_nmd OWNER TO public_loader;

--
-- TOC entry 1411 (class 1247 OID 31376)
-- Name: type_origin; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_origin AS ENUM (
    'HKU',
    'Charité',
    'UFRN',
    'DMSC',
    'Wuhan Jin. Hos.',
    'CDC-US',
    'KMU/IPI',
    'CDC-China',
    'Institut Pasteur',
    'NIID',
    'IBS',
    'HKSAR',
    'NCID',
    'IRMC',
    'JUST',
    'CIP',
    'UCSF',
    'KFSHRC',
    'ICMR-NRRH',
    'PDI-VIDRL',
    'ARU-MTRC',
    'CAS',
    'StPaulH',
    'LU-LMBI',
    'PHV',
    'ParagonG',
    'GoetheU',
    'NEB',
    'BH-RO',
    'ABL',
    'KRICT',
    'AcSIR',
    'UOC',
    'OSCAR',
    'Nantong University',
    'CBUMRI',
    'Capital Institute of Pediatrics',
    'ArticNetwork',
    'KMU-IPI'
);


ALTER TYPE datahub_0.type_origin OWNER TO public_loader;

--
-- TOC entry 1414 (class 1247 OID 31456)
-- Name: type_primerset; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_primerset AS ENUM (
    'Chan-set',
    'Chu-set',
    'Corman-set',
    'Davi-set',
    'DMSC-set',
    'Huang-set',
    'Lu-set',
    'Mollaei-set',
    'Niu-set',
    'IP-set',
    'Shirato-set',
    'Won-set',
    'Yip-set',
    'Young-set',
    'Tombuloglu-set',
    'Sarkar-set',
    'Yan-set',
    'Telwatte-set',
    'Alhamlan-set',
    'Jawade-set',
    'Caly-set',
    'Bustin-set',
    'Zhou-set',
    'LuRJ-set',
    'LuRJ_mut-set',
    'Matic_mut-set',
    'Sater_mut-set',
    'Northill_nested-set',
    'Northill-set',
    'Li-set',
    'Toptan-set',
    'Zhang-set',
    'Lamb-set',
    'Yu-set',
    'Park-set',
    'Jamwal-set',
    'Schermer-set',
    'Baek-set',
    'Artic_V3_primerpool_1',
    'Artic_V3_primerpool_2',
    'Artic_V4_primerpool_1',
    'Artic_V4_primerpool_2'
);


ALTER TYPE datahub_0.type_primerset OWNER TO public_loader;

--
-- TOC entry 1417 (class 1247 OID 31542)
-- Name: type_primertype; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_primertype AS ENUM (
    'F',
    'R',
    'probe'
);


ALTER TYPE datahub_0.type_primertype OWNER TO public_loader;

--
-- TOC entry 1202 (class 1247 OID 16456)
-- Name: type_quality; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_quality AS ENUM (
    'bad',
    'good',
    'mediocre'
);


ALTER TYPE datahub_0.type_quality OWNER TO public_loader;

--
-- TOC entry 1193 (class 1247 OID 16434)
-- Name: type_rank; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_rank AS ENUM (
    '1/1',
    '2/2',
    '1/2'
);


ALTER TYPE datahub_0.type_rank OWNER TO public_loader;

--
-- TOC entry 1175 (class 1247 OID 16393)
-- Name: type_sex; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_sex AS ENUM (
    'male',
    'female'
);


ALTER TYPE datahub_0.type_sex OWNER TO public_loader;

--
-- TOC entry 1181 (class 1247 OID 16404)
-- Name: type_status; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_status AS ENUM (
    'active surveillance in response to outbreak',
    'active surveillance not initiated by an outbreak',
    'other',
    'actv survllnc in resp to outbrk;actv surv not initd by outbrk',
    'other;active surveillance in response to outbreak',
    'farm sample',
    'Active surveillance in prolonged infection'
);


ALTER TYPE datahub_0.type_status OWNER TO public_loader;

--
-- TOC entry 1196 (class 1247 OID 16442)
-- Name: type_transcriptbiotype; Type: TYPE; Schema: datahub_0; Owner: public_loader
--

CREATE TYPE datahub_0.type_transcriptbiotype AS ENUM (
    'protein_coding'
);


ALTER TYPE datahub_0.type_transcriptbiotype OWNER TO public_loader;

--
-- TOC entry 562 (class 1255 OID 28383)
-- Name: barcode_dist(text[], text[]); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.barcode_dist(b1 text[], b2 text[]) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare 
  l int;
  d1 int;
  d2 int;
  x text;
begin
    d1 := array_length(b1, 1);
    d2 := array_length(b2, 1);
    l := d1 + d2;
    if d2 > d1 then
      foreach x in array b1 loop
          if (select x = any (b2)) then
           l := l - 2;
          end if;
      end loop;
    else
      foreach x in array b2 loop
          if (select x = any (b1)) then
           l := l - 2;
          end if;
      end loop;
    end if;
    return l;
end; $$;


ALTER FUNCTION datahub_0.barcode_dist(b1 text[], b2 text[]) OWNER TO public_loader;

--
-- TOC entry 540 (class 1255 OID 28801)
-- Name: barcode_dist(integer, integer); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.barcode_dist(b1 integer, b2 integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
    return datahub_0.barcode_dist((
select aa_mutation from datahub_0.barcode where id = b1
    ), (
select aa_mutation from datahub_0.barcode where id = b2
    ));
end; $$;


ALTER FUNCTION datahub_0.barcode_dist(b1 integer, b2 integer) OWNER TO public_loader;

--
-- TOC entry 537 (class 1255 OID 16946)
-- Name: convert_list_aa(text[]); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.convert_list_aa(VARIADIC list text[]) RETURNS TABLE(hgvs_p character varying)
    LANGUAGE plpgsql
    AS $$
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
END; $$;


ALTER FUNCTION datahub_0.convert_list_aa(VARIADIC list text[]) OWNER TO public_loader;

--
-- TOC entry 542 (class 1255 OID 16950)
-- Name: convert_single_aa(character); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.convert_single_aa(character) RETURNS character
    LANGUAGE sql
    AS $_$
    WITH aa_left_three AS (
      SELECT symbol_3letter
      FROM datahub_0.amino_acid_symbol
      WHERE symbol_1letter=(SELECT LEFT($1, 1) AS ExtractString)
      )
   , aa_right_three AS (
      SELECT symbol_3letter
      FROM datahub_0.amino_acid_symbol
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
$_$;


ALTER FUNCTION datahub_0.convert_single_aa(character) OWNER TO public_loader;

--
-- TOC entry 538 (class 1255 OID 16947)
-- Name: convert_single_aa_list(text[]); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.convert_single_aa_list(VARIADIC list text[]) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION datahub_0.convert_single_aa_list(VARIADIC list text[]) OWNER TO public_loader;

--
-- TOC entry 539 (class 1255 OID 16948)
-- Name: convert_single_aa_list_test(text[]); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.convert_single_aa_list_test(VARIADIC list text[]) RETURNS TABLE(hgvs_p character varying)
    LANGUAGE plpgsql
    AS $$
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
END; $$;


ALTER FUNCTION datahub_0.convert_single_aa_list_test(VARIADIC list text[]) OWNER TO public_loader;

--
-- TOC entry 541 (class 1255 OID 16949)
-- Name: convert_single_aa_protein_pairs_list(text[]); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.convert_single_aa_protein_pairs_list(VARIADIC list text[]) RETURNS TABLE(gene_name text, hgvs_p text)
    LANGUAGE plpgsql
    AS $$
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
END; $$;


ALTER FUNCTION datahub_0.convert_single_aa_protein_pairs_list(VARIADIC list text[]) OWNER TO public_loader;

--
-- TOC entry 558 (class 1255 OID 25687)
-- Name: filter_country_count(); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.filter_country_count() RETURNS TABLE(country text, count bigint)
    LANGUAGE sql
    AS $$
  SELECT country::text, count(*)
  FROM temp_filter
  GROUP BY country; 
$$;


ALTER FUNCTION datahub_0.filter_country_count() OWNER TO public_loader;

--
-- TOC entry 559 (class 1255 OID 25688)
-- Name: filter_country_count_time(); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.filter_country_count_time() RETURNS TABLE(collection_date date, country text, other_count bigint, variant_count bigint)
    LANGUAGE sql
    AS $$
  WITH temp1 AS (
    SELECT *
    FROM datahub_0.test_background_sample_counts tbsc 
    WHERE collection_date > date ('2019-04-24') 
  ),
  temp2 AS (
    SELECT t.collection_date as collection_date, t.country as country, count(*)
    FROM  temp_filter t
    GROUP BY country, collection_date
  )
  SELECT temp1.collection_date, temp1.country, temp1.count-coalesce(temp2.count, 0) AS other_count, coalesce(temp2.count, 0) AS variant_count 
  FROM temp1
  LEFT JOIN temp2 
  USING (collection_date, country)
$$;


ALTER FUNCTION datahub_0.filter_country_count_time() OWNER TO public_loader;

--
-- TOC entry 563 (class 1255 OID 29922)
-- Name: filter_custom_browser(text, text); Type: PROCEDURE; Schema: datahub_0; Owner: public_loader
--

CREATE PROCEDURE datahub_0.filter_custom_browser(IN inclusions text, IN exclusions text)
    LANGUAGE sql
    AS $$
  DROP TABLE IF EXISTS temp_filter; 
 
  SELECT aam.country_name as country, aam.ena_run, aam.collection_date
  INTO temp table temp_filter
  FROM datahub_0.aa_mutation aam
  where aam.barcode_id in (
    select b.id
    from datahub_0.barcode b 
    WHERE datahub_0.test_exclusion(b.aa_mutation::text[], string_to_array(exclusions, ',')) 
      AND datahub_0.test_inclusion(b.aa_mutation::text[], string_to_array(inclusions, ','))
  );
$$;


ALTER PROCEDURE datahub_0.filter_custom_browser(IN inclusions text, IN exclusions text) OWNER TO public_loader;

--
-- TOC entry 560 (class 1255 OID 25691)
-- Name: filter_custom_browser_cov(text, text); Type: PROCEDURE; Schema: datahub_0; Owner: public_loader
--

CREATE PROCEDURE datahub_0.filter_custom_browser_cov(IN inclusions text, IN exclusions text)
    LANGUAGE sql
    AS $$
  DROP TABLE IF EXISTS temp_filter; 
 
 with bc as (
  select b.id
    from datahub_0.barcode b 
    WHERE datahub_0.test_exclusion(b.aa_mutation::text[], string_to_array(exclusions, ',')) 
      AND datahub_0.test_inclusion(b.aa_mutation::text[], string_to_array(inclusions, ','))
 ), neg_select AS (
    SELECT runid
    FROM datahub_0.cov_s_pos
          WHERE pos_aa IN (
            select unnest(string_to_array(regexp_replace(inclusions, '[^0-9,]', '', 'g') , ',')::integer[])
            union
            select unnest(string_to_array(regexp_replace(inclusions, '[^0-9,]', '', 'g') , ',')::integer[])
          )
          GROUP BY runid
  ), aa AS (
    SELECT aam.runid, aam.country_name, aam.ena_run, aam.collection_date
    FROM datahub_0.aa_mutation aam
    WHERE aam.barcode_id IN (select id from bc)
  )
  
  SELECT country_name as country, ena_run, collection_date
  INTO temp table temp_filter
  FROM aa
  LEFT JOIN neg_select 
  ON aa.runid = neg_select.runid
  WHERE neg_select.runid IS null;
$$;


ALTER PROCEDURE datahub_0.filter_custom_browser_cov(IN inclusions text, IN exclusions text) OWNER TO public_loader;

--
-- TOC entry 557 (class 1255 OID 25679)
-- Name: filter_temp(text, text, integer); Type: PROCEDURE; Schema: datahub_0; Owner: public_loader
--

CREATE PROCEDURE datahub_0.filter_temp(IN inclusions text, IN exclusions text, IN n_variants integer)
    LANGUAGE sql
    AS $$
  DROP TABLE IF EXISTS temp_filter; 

  SELECT max(country_name) as country, ena_run, count(country_name), collection_date
  INTO TEMP temp_filter
  FROM datahub_0.aa_mutation
  WHERE NOT hgvs_p IN (select unnest(string_to_array(exclusions, ','))) AND hgvs_p IN (select unnest(string_to_array(inclusions, ',')))
  GROUP BY ena_run, collection_date
  HAVING count(ena_run) = n_variants; 
$$;


ALTER PROCEDURE datahub_0.filter_temp(IN inclusions text, IN exclusions text, IN n_variants integer) OWNER TO public_loader;

--
-- TOC entry 543 (class 1255 OID 16951)
-- Name: host_human_id(); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.host_human_id() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE r INT;
BEGIN
 SELECT host.id INTO r
   FROM datahub_0.host
   WHERE host.host::text = 'Homo sapiens'::text;
 RETURN r;
END; 
$$;


ALTER FUNCTION datahub_0.host_human_id() OWNER TO public_loader;

--
-- TOC entry 536 (class 1255 OID 16945)
-- Name: lookup_annotation(integer, datahub_0.type_genename); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.lookup_annotation(key integer, gene_name datahub_0.type_genename) RETURNS character varying
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
    SELECT CONCAT_WS('&', (
      SELECT CAST(annotation_atom AS VARCHAR(64))
        FROM datahub_0.annotation_binding
        WHERE key = key AND gene_name = gene_name
        ))
       $$;


ALTER FUNCTION datahub_0.lookup_annotation(key integer, gene_name datahub_0.type_genename) OWNER TO public_loader;

--
-- TOC entry 561 (class 1255 OID 25957)
-- Name: mutation_aa(integer[], integer[], character[], character[]); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.mutation_aa(cdn_pos integer[], pos integer[], ref character[], alt character[]) RETURNS character[]
    LANGUAGE plpgsql
    AS $$
declare
  ra char[];
  rr char[];
  s integer;
  i integer;
  fnd bool;
  cp integer;
  cdn integer;
  r char;
  raar char(3);
  raaa char(3);
begin
  s := cdn_pos[1] + pos[1];
  for cdn_ in 0..2 loop
    i := 0;
    cdn := 2 - cdn_;
    fnd := false;
    foreach cp in array cdn_pos loop
      i := i + 1;
      if cp = cdn then
        --raise notice 'cdn: %, alt: %', cdn, alt[i];
        rr := array_append(rr, ref[i]);
        ra := array_append(ra, alt[i]);
        fnd := true;
      end if;
    end loop;
    if not fnd then
      select rg.na into r
      from datahub_0.reference_genome rg
      where rg.pos = s - cdn;
      --raise notice 'not found %, pos: % ref: %', cdn, s - cdn, r;
      ra := array_append(ra, r);
      rr := array_append(rr, r);
    end if;
  end loop;
  select cc.aa into raar
  from datahub_0.codon_code cc 
  where cc.codon = array_to_string(rr, '');
  select cc.aa into raaa
  from datahub_0.codon_code cc 
  where cc.codon = array_to_string(ra, '');
  return array[array_to_string(rr, ''), raar, array_to_string(ra, ''), raaa ];
end;$$;


ALTER FUNCTION datahub_0.mutation_aa(cdn_pos integer[], pos integer[], ref character[], alt character[]) OWNER TO public_loader;

--
-- TOC entry 544 (class 1255 OID 29679)
-- Name: test_exclusion(anyarray, anyarray); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.test_exclusion(aam anyarray, exclusion_to_test anyarray) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
  l int;
  r bool;
begin
  select count(*)
  into l
  from (
    SELECT unnest(aam) 
    intersect 
    select unnest(exclusion_to_test)
  ) as i;
  if l = 0 then r := true;
  else r := false;
  end if;
   return r;
end
$$;


ALTER FUNCTION datahub_0.test_exclusion(aam anyarray, exclusion_to_test anyarray) OWNER TO public_loader;

--
-- TOC entry 545 (class 1255 OID 29680)
-- Name: test_inclusion(anyarray, anyarray); Type: FUNCTION; Schema: datahub_0; Owner: public_loader
--

CREATE FUNCTION datahub_0.test_inclusion(aam anyarray, inclusion_to_test anyarray) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
  l_orig int;
  l int;
  r bool;
begin
  l_orig := array_length(inclusion_to_test, 1);
  select count(*)
  into l
  from (
    SELECT unnest(aam) 
    intersect 
    select unnest(inclusion_to_test)
  ) as i;
  if l = l_orig then r := true;
  else r := false;
  end if;
   return r;
end
$$;


ALTER FUNCTION datahub_0.test_inclusion(aam anyarray, inclusion_to_test anyarray) OWNER TO public_loader;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 249 (class 1259 OID 16847)
-- Name: amino_acid_symbol; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.amino_acid_symbol (
    name character varying(16),
    symbol_3letter character(3),
    symbol_1letter character(1)
);


ALTER TABLE datahub_0.amino_acid_symbol OWNER TO public_loader;

--
-- TOC entry 254 (class 1259 OID 16908)
-- Name: annotation; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.annotation (
    key bigint,
    annotation_impact datahub_0.type_annotationimpact,
    gene_name datahub_0.type_genename,
    feature_type datahub_0.type_featuretype,
    feature_id datahub_0.type_featureid,
    transcript_biotype datahub_0.type_transcriptbiotype,
    rank_ datahub_0.type_rank,
    hgvs_c text,
    hgvs_p text,
    cdna_pos integer,
    cdna_length integer,
    cds_pos integer,
    cds_length integer,
    aa_pos integer,
    aa_length integer,
    distance integer,
    errors_warnings_info text
);


ALTER TABLE datahub_0.annotation OWNER TO public_loader;

--
-- TOC entry 253 (class 1259 OID 16898)
-- Name: vcf; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.vcf (
    key bigint NOT NULL,
    qual integer,
    dp integer,
    af real,
    sb integer,
    count_ref_forward_base integer,
    count_ref_reverse_base integer,
    count_alt_forward_base integer,
    count_alt_reverse_base integer,
    hrun integer,
    indel boolean,
    nmd datahub_0.type_nmd,
    major boolean,
    ann_num integer
);


ALTER TABLE datahub_0.vcf OWNER TO public_loader;

--
-- TOC entry 251 (class 1259 OID 16878)
-- Name: vcf_key; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.vcf_key (
    key bigint NOT NULL,
    runid integer,
    pos integer NOT NULL,
    ref text NOT NULL,
    alt text
);


ALTER TABLE datahub_0.vcf_key OWNER TO public_loader;

--
-- TOC entry 467 (class 1259 OID 29881)
-- Name: _bc_stg1; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0._bc_stg1 AS
 WITH a AS (
         SELECT a_1.key,
            a_1.hgvs_p,
            a_1.cdna_pos,
            a_1.aa_pos
           FROM datahub_0.annotation a_1
          WHERE ((a_1.feature_id = 'GU280_gp02'::datahub_0.type_featureid) AND (a_1.hgvs_p ~ '^p\.[A-Z][a-z]{2}[0-9]+[A-Z][a-z]{2}$'::text) AND ("substring"(a_1.hgvs_p, 3, 3) IN ( SELECT aas.symbol_3letter
                   FROM datahub_0.amino_acid_symbol aas)) AND ("substring"(a_1.hgvs_p, (char_length(a_1.hgvs_p) - 2), 3) IN ( SELECT aas.symbol_3letter
                   FROM datahub_0.amino_acid_symbol aas)) AND ("substring"(a_1.hgvs_p, 3, 3) <> "substring"(a_1.hgvs_p, (char_length(a_1.hgvs_p) - 2), 3)))
        )
 SELECT vk.key,
    vk.runid,
    vk.pos,
    vk.ref,
    vk.alt,
    a.aa_pos,
    a.hgvs_p,
    ((3 * a.aa_pos) - a.cdna_pos) AS codon_pos
   FROM ((a
     JOIN datahub_0.vcf_key vk USING (key))
     JOIN datahub_0.vcf v USING (key))
  WHERE (v.af >= (0.5)::double precision)
  WITH NO DATA;


ALTER TABLE datahub_0._bc_stg1 OWNER TO public_loader;

--
-- TOC entry 468 (class 1259 OID 29890)
-- Name: _bc_stg2; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0._bc_stg2 AS
 WITH tmp AS (
         SELECT _bc_stg1.runid,
            _bc_stg1.aa_pos,
            datahub_0.mutation_aa(array_agg(_bc_stg1.codon_pos), array_agg(_bc_stg1.pos), (array_agg(_bc_stg1.ref))::bpchar[], (array_agg(_bc_stg1.alt))::bpchar[]) AS m
           FROM datahub_0._bc_stg1
          GROUP BY _bc_stg1.runid, _bc_stg1.aa_pos
        ), s AS (
         SELECT tmp.runid,
            tmp.aa_pos,
            tmp.m,
            concat('p.', tmp.m[2], tmp.aa_pos, tmp.m[4]) AS hgvs_p
           FROM tmp
          WHERE (tmp.m[2] <> tmp.m[4])
        )
 SELECT s.runid,
    array_agg(s.hgvs_p ORDER BY s.aa_pos) AS aa_mutation
   FROM s
  GROUP BY s.runid
  WITH NO DATA;


ALTER TABLE datahub_0._bc_stg2 OWNER TO public_loader;

--
-- TOC entry 469 (class 1259 OID 29903)
-- Name: barcode; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.barcode AS
 WITH u AS (
         SELECT DISTINCT _bc_stg2.aa_mutation
           FROM datahub_0._bc_stg2
        )
 SELECT row_number() OVER () AS id,
    u.aa_mutation
   FROM u
  WITH NO DATA;


ALTER TABLE datahub_0.barcode OWNER TO public_loader;

--
-- TOC entry 236 (class 1259 OID 16730)
-- Name: country; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.country (
    id integer NOT NULL,
    iso_a3 character(3),
    iso_a2 character(2),
    country_name character varying(64),
    country_name_local text,
    population_2021 integer
);


ALTER TABLE datahub_0.country OWNER TO public_loader;

--
-- TOC entry 245 (class 1259 OID 16770)
-- Name: metadata; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.metadata (
    runid integer NOT NULL,
    collection_date date,
    collection_date_valid boolean,
    country_id integer,
    host_id integer,
    host_sex datahub_0.type_sex,
    instrument_id integer,
    sample_accession character varying(16),
    study_accession character varying(16),
    experiment_accession character varying(16)
);


ALTER TABLE datahub_0.metadata OWNER TO public_loader;

--
-- TOC entry 234 (class 1259 OID 16721)
-- Name: runid; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.runid (
    id integer NOT NULL,
    ena_run character varying(16) NOT NULL
);


ALTER TABLE datahub_0.runid OWNER TO public_loader;

--
-- TOC entry 470 (class 1259 OID 29909)
-- Name: aa_mutation; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.aa_mutation AS
 SELECT r.ena_run,
    c.country_name,
    c.iso_a3,
    c.id AS country_id,
    m.collection_date,
    t.runid,
    t.aa_mutation,
    bc.id AS barcode_id
   FROM ((((datahub_0._bc_stg2 t
     JOIN datahub_0.barcode bc ON (((bc.aa_mutation)::character varying[] = (t.aa_mutation)::character varying[])))
     JOIN datahub_0.runid r ON ((r.id = t.runid)))
     JOIN datahub_0.metadata m ON ((m.runid = r.id)))
     JOIN datahub_0.country c ON ((c.id = m.country_id)))
  WITH NO DATA;


ALTER TABLE datahub_0.aa_mutation OWNER TO public_loader;

--
-- TOC entry 252 (class 1259 OID 16890)
-- Name: annotation_binding; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.annotation_binding (
    key bigint,
    gene_name datahub_0.type_genename,
    annotation_atom datahub_0.type_annotation_atom
);


ALTER TABLE datahub_0.annotation_binding OWNER TO public_loader;

--
-- TOC entry 246 (class 1259 OID 16795)
-- Name: metaextension; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.metaextension (
    runid integer NOT NULL,
    description text,
    fastq_ftp text,
    isolate text,
    sample_capture_status datahub_0.type_status,
    strain character varying(128),
    checklist character varying(16),
    base_count double precision,
    library_name character varying(128),
    library_id integer,
    first_created date,
    first_public date,
    collector_id integer,
    country_raw text
);


ALTER TABLE datahub_0.metaextension OWNER TO public_loader;

--
-- TOC entry 444 (class 1259 OID 29419)
-- Name: human_metadata; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.human_metadata AS
 SELECT m.runid,
    m.collection_date,
    m.country_id,
    m.host_sex,
    m.instrument_id,
    m.sample_accession,
    m.study_accession,
    m.experiment_accession,
    date_part('isoyear'::text, m.collection_date) AS date_year,
    date_part('week'::text, m.collection_date) AS date_week,
    to_date(concat(date_part('isoyear'::text, m.collection_date), date_part('week'::text, m.collection_date)), 'iyyyiw'::text) AS date_truncated
   FROM (datahub_0.metadata m
     JOIN datahub_0.metaextension me ON ((m.runid = me.runid)))
  WHERE ((m.country_id IS NOT NULL) AND (m.host_id = datahub_0.host_human_id()) AND (m.collection_date >= '2019-12-30'::date) AND m.collection_date_valid AND (me.first_created > m.collection_date))
  WITH NO DATA;


ALTER TABLE datahub_0.human_metadata OWNER TO public_loader;

--
-- TOC entry 445 (class 1259 OID 29431)
-- Name: app_country_samples_full; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.app_country_samples_full AS
 WITH temp_stat AS (
         SELECT m.country_id,
            count(*) AS n_sample
           FROM datahub_0.human_metadata m
          GROUP BY m.country_id
        )
 SELECT c.country_name AS country,
    temp_stat.n_sample,
    round((log((temp_stat.n_sample)::double precision))::numeric, 3) AS log_n_sample,
    round(((((temp_stat.n_sample)::double precision / (c.population_2021)::double precision) * (1000000)::double precision))::numeric, 3) AS relative_n_sample,
    round((log((((temp_stat.n_sample)::double precision / (c.population_2021)::double precision) * (1000000)::double precision)))::numeric, 3) AS relative_log_n_sample
   FROM (temp_stat
     JOIN datahub_0.country c ON ((c.id = temp_stat.country_id)))
  WITH NO DATA;


ALTER TABLE datahub_0.app_country_samples_full OWNER TO public_loader;

--
-- TOC entry 479 (class 1259 OID 30094)
-- Name: app_human_meta_mv; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.app_human_meta_mv AS
 SELECT c.country_name,
    m.date_year,
    m.date_week,
    to_date(((m.date_year)::text || (m.date_week)::text), 'iyyyiw'::text) AS date,
    count(*) AS weekly_sample
   FROM (datahub_0.human_metadata m
     JOIN datahub_0.country c ON ((c.id = m.country_id)))
  GROUP BY c.country_name, m.date_year, m.date_week
  WITH NO DATA;


ALTER TABLE datahub_0.app_human_meta_mv OWNER TO public_loader;

--
-- TOC entry 448 (class 1259 OID 29458)
-- Name: jhd_covid_country_weekly; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.jhd_covid_country_weekly (
    country_id integer,
    date_year integer,
    date_week integer,
    cases integer
);


ALTER TABLE datahub_0.jhd_covid_country_weekly OWNER TO public_loader;

--
-- TOC entry 480 (class 1259 OID 30099)
-- Name: app_human_meta_mv_jhd; Type: VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE VIEW datahub_0.app_human_meta_mv_jhd AS
 SELECT hm.country_name,
    to_date(((hm.date_year)::text || (hm.date_week)::text), 'iyyyiw'::text) AS date,
    hm.date_year,
    hm.date_week,
    hm.weekly_sample,
    j.cases,
    round((((hm.weekly_sample)::numeric / (j.cases)::numeric) * (100)::numeric), 2) AS pct
   FROM ((datahub_0.jhd_covid_country_weekly j
     LEFT JOIN datahub_0.country c ON ((j.country_id = c.id)))
     RIGHT JOIN datahub_0.app_human_meta_mv hm ON ((((hm.country_name)::text = (c.country_name)::text) AND (hm.date_year = (j.date_year)::double precision) AND (hm.date_week = (j.date_week)::double precision))))
  WHERE (j.cases <> 0);


ALTER TABLE datahub_0.app_human_meta_mv_jhd OWNER TO public_loader;

--
-- TOC entry 248 (class 1259 OID 16822)
-- Name: lineage_def; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.lineage_def (
    variant_id text,
    pango text,
    type_variant text,
    amino_acid_change text,
    protein_codon_position integer,
    ref_protein text,
    alt_protein text,
    gene text,
    effect text,
    snpeff_original_mut text,
    ref_pos_alt text,
    ref text,
    alt text,
    pos integer,
    description text
);


ALTER TABLE datahub_0.lineage_def OWNER TO public_loader;

--
-- TOC entry 250 (class 1259 OID 16868)
-- Name: unique_vcf; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.unique_vcf (
    runid integer NOT NULL,
    insertion_ts timestamp without time zone,
    snapshot character varying(32) NOT NULL,
    integrity datahub_0.type_integrity NOT NULL
);


ALTER TABLE datahub_0.unique_vcf OWNER TO public_loader;

--
-- TOC entry 270 (class 1259 OID 17149)
-- Name: variant_mutations; Type: VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE VIEW datahub_0.variant_mutations AS
 SELECT ld.variant_id,
    count(*) AS mutations
   FROM datahub_0.lineage_def ld
  GROUP BY ld.variant_id;


ALTER TABLE datahub_0.variant_mutations OWNER TO public_loader;

--
-- TOC entry 446 (class 1259 OID 29438)
-- Name: lineage; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.lineage AS
 WITH lineage_not_analyzed_w AS (
         SELECT m.runid,
            'Not analysed yet'::text AS variant_id,
            0 AS n,
            0 AS required_mutation
           FROM (datahub_0.unique_vcf uv
             RIGHT JOIN datahub_0.human_metadata m ON ((uv.runid = m.runid)))
          WHERE (uv.runid IS NULL)
        ), lhs AS (
         SELECT vk.runid,
            ld.variant_id,
            count(*) AS n
           FROM ((datahub_0.vcf_key vk
             JOIN datahub_0.vcf v ON ((vk.key = v.key)))
             JOIN datahub_0.lineage_def ld ON (((vk.pos = ld.pos) AND (vk.ref = ld.ref) AND (vk.alt = ld.alt))))
          WHERE ((v.af > (0.5)::double precision) OR v.major)
          GROUP BY vk.runid, ld.variant_id
        ), lineage0_w AS (
         SELECT lhs.runid,
            lhs.variant_id,
            lhs.n,
            vm.mutations AS required_mutation
           FROM (lhs
             LEFT JOIN datahub_0.variant_mutations vm ON ((lhs.variant_id = vm.variant_id)))
          WHERE (lhs.n = vm.mutations)
        ), lineage_base_w AS (
         SELECT DISTINCT ON (lineage0_w.runid) lineage0_w.runid,
            lineage0_w.variant_id,
            lineage0_w.n,
            lineage0_w.required_mutation
           FROM lineage0_w
          ORDER BY lineage0_w.runid, lineage0_w.required_mutation DESC
        ), lineage_other_w AS (
         SELECT DISTINCT ON (runids.runid) runids.runid,
            'Other variant'::text AS variant_id,
            0 AS n,
            0 AS required_mutation
           FROM (lineage_base_w
             RIGHT JOIN datahub_0.vcf_key runids ON ((lineage_base_w.runid = runids.runid)))
          WHERE (lineage_base_w.runid IS NULL)
        )
 SELECT lineage_base_w.runid,
    lineage_base_w.variant_id,
    lineage_base_w.n,
    lineage_base_w.required_mutation
   FROM lineage_base_w
UNION
 SELECT lineage_other_w.runid,
    lineage_other_w.variant_id,
    lineage_other_w.n,
    lineage_other_w.required_mutation
   FROM lineage_other_w
UNION
 SELECT lineage_not_analyzed_w.runid,
    lineage_not_analyzed_w.variant_id,
    lineage_not_analyzed_w.n,
    lineage_not_analyzed_w.required_mutation
   FROM lineage_not_analyzed_w
  WITH NO DATA;


ALTER TABLE datahub_0.lineage OWNER TO public_loader;

--
-- TOC entry 447 (class 1259 OID 29445)
-- Name: app_lineage; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.app_lineage AS
 WITH tmp_meta1 AS (
         SELECT count(*) AS n,
            m.collection_date,
            m.country_id,
            l.variant_id
           FROM (datahub_0.human_metadata m
             JOIN datahub_0.lineage l ON ((l.runid = m.runid)))
          GROUP BY m.collection_date, m.country_id, l.variant_id
        ), temp_lineage2 AS (
         SELECT tmp_meta1.collection_date,
            tmp_meta1.country_id,
            sum(tmp_meta1.n) AS n_all
           FROM tmp_meta1
          GROUP BY tmp_meta1.collection_date, tmp_meta1.country_id
        )
 SELECT t1.collection_date,
    c.country_name AS country,
    t1.variant_id,
    t1.n,
    temp_lineage2.n_all,
    (((t1.n)::numeric / temp_lineage2.n_all) * (100)::numeric) AS pct
   FROM ((tmp_meta1 t1
     JOIN temp_lineage2 USING (collection_date, country_id))
     JOIN datahub_0.country c ON ((c.id = t1.country_id)))
  WITH NO DATA;


ALTER TABLE datahub_0.app_lineage OWNER TO public_loader;

--
-- TOC entry 449 (class 1259 OID 29471)
-- Name: app_new_cases_jhd; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.app_new_cases_jhd AS
 WITH tmp_meta1 AS (
         SELECT count(*) AS weekly_sample,
            m.country_id,
            m.date_year,
            m.date_week,
            m.date_truncated
           FROM datahub_0.human_metadata m
          GROUP BY m.country_id, m.date_year, m.date_week, m.date_truncated
        )
 SELECT c.country_name AS country,
    t.date_truncated AS date,
    t.date_year,
    t.date_week,
    t.weekly_sample,
    jhdw.cases
   FROM ((tmp_meta1 t
     LEFT JOIN datahub_0.jhd_covid_country_weekly jhdw USING (country_id, date_year, date_week))
     JOIN datahub_0.country c ON ((c.id = t.country_id)))
  WITH NO DATA;


ALTER TABLE datahub_0.app_new_cases_jhd OWNER TO public_loader;

--
-- TOC entry 450 (class 1259 OID 29476)
-- Name: app_variants_weekly; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.app_variants_weekly AS
 SELECT c.country_name AS country,
    m.date_year,
    m.date_week,
    l.variant_id,
    count(*) AS weekly_variant_sample
   FROM ((datahub_0.human_metadata m
     JOIN datahub_0.lineage l USING (runid))
     JOIN datahub_0.country c ON ((c.id = m.country_id)))
  GROUP BY c.country_name, m.date_year, m.date_week, l.variant_id
  WITH NO DATA;


ALTER TABLE datahub_0.app_variants_weekly OWNER TO public_loader;

--
-- TOC entry 339 (class 1259 OID 25949)
-- Name: codon_code; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.codon_code (
    na1 character(1),
    na2 character(1),
    na3 character(1),
    codon character(3),
    aa character(3)
);


ALTER TABLE datahub_0.codon_code OWNER TO public_loader;

--
-- TOC entry 238 (class 1259 OID 16739)
-- Name: collector; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.collector (
    id integer NOT NULL,
    broker_name character varying(64),
    collected_by text,
    center_name text
);


ALTER TABLE datahub_0.collector OWNER TO public_loader;

--
-- TOC entry 237 (class 1259 OID 16738)
-- Name: collector_id_seq; Type: SEQUENCE; Schema: datahub_0; Owner: public_loader
--

CREATE SEQUENCE datahub_0.collector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datahub_0.collector_id_seq OWNER TO public_loader;

--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 237
-- Name: collector_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub_0; Owner: public_loader
--

ALTER SEQUENCE datahub_0.collector_id_seq OWNED BY datahub_0.collector.id;


--
-- TOC entry 235 (class 1259 OID 16729)
-- Name: country_id_seq; Type: SEQUENCE; Schema: datahub_0; Owner: public_loader
--

CREATE SEQUENCE datahub_0.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datahub_0.country_id_seq OWNER TO public_loader;

--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 235
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub_0; Owner: public_loader
--

ALTER SEQUENCE datahub_0.country_id_seq OWNED BY datahub_0.country.id;


--
-- TOC entry 257 (class 1259 OID 16936)
-- Name: cov; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.cov (
    runid integer,
    pos integer,
    coverage integer
);


ALTER TABLE datahub_0.cov OWNER TO public_loader;

--
-- TOC entry 288 (class 1259 OID 17386)
-- Name: cov_s_pos; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.cov_s_pos AS
 SELECT DISTINCT c.runid,
    (((c.pos - 21563) / 3) + 1) AS pos_aa
   FROM datahub_0.cov c
  WHERE ((c.coverage <= 30) AND (c.pos >= 21563) AND (c.pos <= 25384))
  WITH NO DATA;


ALTER TABLE datahub_0.cov_s_pos OWNER TO public_loader;

--
-- TOC entry 247 (class 1259 OID 16817)
-- Name: gene_id; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.gene_id (
    gene_id character varying(32) NOT NULL,
    gene_name datahub_0.type_genename NOT NULL
);


ALTER TABLE datahub_0.gene_id OWNER TO public_loader;

--
-- TOC entry 240 (class 1259 OID 16748)
-- Name: host; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.host (
    id integer NOT NULL,
    host character varying(128) NOT NULL,
    tax_id integer
);


ALTER TABLE datahub_0.host OWNER TO public_loader;

--
-- TOC entry 239 (class 1259 OID 16747)
-- Name: host_id_seq; Type: SEQUENCE; Schema: datahub_0; Owner: public_loader
--

CREATE SEQUENCE datahub_0.host_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datahub_0.host_id_seq OWNER TO public_loader;

--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 239
-- Name: host_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub_0; Owner: public_loader
--

ALTER SEQUENCE datahub_0.host_id_seq OWNED BY datahub_0.host.id;


--
-- TOC entry 242 (class 1259 OID 16755)
-- Name: instrument; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.instrument (
    id integer NOT NULL,
    instrument_platform character varying(16) NOT NULL,
    instrument_model character varying(32) NOT NULL
);


ALTER TABLE datahub_0.instrument OWNER TO public_loader;

--
-- TOC entry 241 (class 1259 OID 16754)
-- Name: instrument_id_seq; Type: SEQUENCE; Schema: datahub_0; Owner: public_loader
--

CREATE SEQUENCE datahub_0.instrument_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datahub_0.instrument_id_seq OWNER TO public_loader;

--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 241
-- Name: instrument_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub_0; Owner: public_loader
--

ALTER SEQUENCE datahub_0.instrument_id_seq OWNED BY datahub_0.instrument.id;


--
-- TOC entry 244 (class 1259 OID 16764)
-- Name: library; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.library (
    id integer NOT NULL,
    layout datahub_0.type_layout NOT NULL,
    source character varying(32),
    selection character varying(32),
    strategy character varying(32)
);


ALTER TABLE datahub_0.library OWNER TO public_loader;

--
-- TOC entry 243 (class 1259 OID 16763)
-- Name: library_id_seq; Type: SEQUENCE; Schema: datahub_0; Owner: public_loader
--

CREATE SEQUENCE datahub_0.library_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datahub_0.library_id_seq OWNER TO public_loader;

--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 243
-- Name: library_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub_0; Owner: public_loader
--

ALTER SEQUENCE datahub_0.library_id_seq OWNED BY datahub_0.library.id;


--
-- TOC entry 272 (class 1259 OID 17198)
-- Name: n_content; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.n_content AS
 SELECT c.runid,
    count(c.pos) AS num_of_pos_with_cov_nothigher_10,
    ((count(c.pos))::numeric / (29903)::numeric) AS estimated_n_content,
        CASE
            WHEN (((count(c.pos))::numeric / (29903)::numeric) < 0.1) THEN 'good'::datahub_0.type_quality
            WHEN ((((count(c.pos))::numeric / (29903)::numeric) <= 0.3) AND (((count(c.pos))::numeric / (29903)::numeric) >= 0.1)) THEN 'mediocre'::datahub_0.type_quality
            WHEN (((count(c.pos))::numeric / (29903)::numeric) > 0.3) THEN 'bad'::datahub_0.type_quality
            ELSE NULL::datahub_0.type_quality
        END AS quality_status
   FROM datahub_0.cov c
  WHERE ((c.coverage)::numeric <= (10)::numeric)
  GROUP BY c.runid
  WITH NO DATA;


ALTER TABLE datahub_0.n_content OWNER TO public_loader;

--
-- TOC entry 497 (class 1259 OID 31549)
-- Name: pcr_primers; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.pcr_primers (
    id integer NOT NULL,
    country_id integer,
    method datahub_0.type_method,
    origin datahub_0.type_origin,
    primer_set datahub_0.type_primerset,
    primer_name character varying(32),
    primer_type datahub_0.type_primertype,
    target_gene datahub_0.type_genename,
    original_primer_name character varying(32),
    target_sequence_start_pos integer,
    target_sequence_end_pos integer,
    target_sequence text,
    upload_time date,
    reference text
);


ALTER TABLE datahub_0.pcr_primers OWNER TO public_loader;

--
-- TOC entry 498 (class 1259 OID 31561)
-- Name: pcr_webpage; Type: VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE VIEW datahub_0.pcr_webpage AS
 SELECT t.primer_set,
    t.primer_name,
    t.method,
    t.primer_type,
    x.word,
    x.rn,
    t.target_sequence_end_pos,
    t.target_sequence_start_pos,
        CASE
            WHEN ((t.primer_type)::text = 'F'::text) THEN ((x.rn + t.target_sequence_start_pos) - 1)
            WHEN ((t.primer_type)::text = 'R'::text) THEN ((t.target_sequence_end_pos - x.rn) + 1)
            WHEN ((t.primer_type)::text = 'probe'::text) THEN ((x.rn + t.target_sequence_start_pos) - 1)
            ELSE (0)::bigint
        END AS pos,
        CASE
            WHEN (x.word = 'Y'::text) THEN 'CT'::text
            WHEN (x.word = 'R'::text) THEN 'AG'::text
            WHEN (x.word = 'M'::text) THEN 'AC'::text
            WHEN (x.word = 'W'::text) THEN 'AT'::text
            WHEN (x.word = 'S'::text) THEN 'GC'::text
            WHEN (x.word = 'K'::text) THEN 'GT'::text
            WHEN (x.word = 'B'::text) THEN 'CGT'::text
            WHEN (x.word = 'D'::text) THEN 'AGT'::text
            WHEN (x.word = 'H'::text) THEN 'ACT'::text
            WHEN (x.word = 'V'::text) THEN 'ACG'::text
            ELSE x.word
        END AS primer_pos
   FROM datahub_0.pcr_primers t,
    LATERAL regexp_split_to_table(t.target_sequence, ''::text) WITH ORDINALITY x(word, rn);


ALTER TABLE datahub_0.pcr_webpage OWNER TO public_loader;

--
-- TOC entry 499 (class 1259 OID 31575)
-- Name: vcf_key_selected; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.vcf_key_selected AS
 SELECT tmp1.key,
    vk.runid,
    vk.pos,
    vk.ref,
    vk.alt
   FROM (datahub_0.vcf_key vk
     JOIN ( SELECT v.key
           FROM datahub_0.vcf v
          WHERE (v.af > (0.1)::double precision)) tmp1 ON ((vk.key = tmp1.key)))
  WITH NO DATA;


ALTER TABLE datahub_0.vcf_key_selected OWNER TO public_loader;

--
-- TOC entry 500 (class 1259 OID 31582)
-- Name: pcr_assay_results_webpage; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.pcr_assay_results_webpage AS
 WITH tbl AS (
         SELECT mn.runid,
            mn.pos,
            mn.alt,
            mn.ref,
            p.primer_set,
            p.primer_name,
            p.primer_type,
            p.method,
                CASE
                    WHEN ((p.primer_type = 'F'::datahub_0.type_primertype) AND ((((p.target_sequence_end_pos)::double precision - (mn.pos)::double precision) + (1)::double precision) < (6)::double precision)) THEN 1
                    WHEN ((p.primer_type = 'R'::datahub_0.type_primertype) AND ((((mn.pos)::double precision - (p.target_sequence_start_pos)::double precision) + (1)::double precision) < (6)::double precision)) THEN 1
                    WHEN ((p.primer_type = 'probe'::datahub_0.type_primertype) AND ((((p.target_sequence_end_pos)::double precision - (mn.pos)::double precision) + (1)::double precision) > (6)::double precision) AND ((((mn.pos)::double precision - (p.target_sequence_start_pos)::double precision) + (1)::double precision) > (6)::double precision)) THEN 1
                    WHEN (length(mn.ref) > length(mn.alt)) THEN 1
                    WHEN (length(mn.ref) < length(mn.alt)) THEN 1
                    ELSE 0
                END AS risk_pos
           FROM (((datahub_0.vcf_key_selected mn
             JOIN datahub_0.vcf v2 ON ((mn.key = v2.key)))
             JOIN datahub_0.n_content n ON ((n.runid = mn.runid)))
             JOIN datahub_0.pcr_webpage p ON ((p.pos = mn.pos)))
          WHERE (((strpos(p.primer_pos, mn.alt) = 0) OR (length(mn.alt) <> length(mn.ref))) AND (v2.dp > 100) AND (n.quality_status = 'good'::datahub_0.type_quality) AND (v2.major OR (v2.af > (0.5)::double precision)))
        )
 SELECT m.runid,
    m.collection_date,
    l.variant_id,
    tbl.method,
    tbl.ref,
    tbl.pos,
    tbl.alt,
    tbl.primer_set,
    tbl.primer_name,
    tbl.primer_type,
    tbl.risk_pos
   FROM ((tbl
     JOIN datahub_0.human_metadata m ON ((m.runid = tbl.runid)))
     JOIN datahub_0.lineage l ON ((l.runid = tbl.runid)))
  GROUP BY m.runid, m.collection_date, l.variant_id, tbl.method, tbl.ref, tbl.pos, tbl.alt, tbl.primer_set, tbl.primer_name, tbl.primer_type, tbl.risk_pos
  ORDER BY m.runid, m.collection_date, l.variant_id, tbl.method, tbl.ref, tbl.pos, tbl.alt, tbl.primer_set, tbl.primer_name, tbl.primer_type, tbl.risk_pos
  WITH NO DATA;


ALTER TABLE datahub_0.pcr_assay_results_webpage OWNER TO public_loader;

--
-- TOC entry 501 (class 1259 OID 31597)
-- Name: pcr_assay_results; Type: VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE VIEW datahub_0.pcr_assay_results AS
 SELECT mv.runid,
    mv.collection_date,
    mv.variant_id,
    mv.ref,
    mv.pos,
    mv.alt,
    mv.primer_set,
    mv.primer_name,
    mv.primer_type,
    mv.risk_pos
   FROM datahub_0.pcr_assay_results_webpage mv
  WHERE (mv.primer_set = ANY (ARRAY['Tombuloglu-set'::datahub_0.type_primerset, 'Young-set'::datahub_0.type_primerset, 'Won-set'::datahub_0.type_primerset, 'Niu-set'::datahub_0.type_primerset, 'Sarkar-set'::datahub_0.type_primerset, 'Lu-set'::datahub_0.type_primerset, 'DMSC-set'::datahub_0.type_primerset, 'Chan-set'::datahub_0.type_primerset, 'Shirato-set'::datahub_0.type_primerset, 'Huang-set'::datahub_0.type_primerset, 'Yip-set'::datahub_0.type_primerset, 'Mollaei-set'::datahub_0.type_primerset, 'IP-set'::datahub_0.type_primerset, 'Chu-set'::datahub_0.type_primerset, 'Davi-set'::datahub_0.type_primerset, 'Corman-set'::datahub_0.type_primerset]));


ALTER TABLE datahub_0.pcr_assay_results OWNER TO public_loader;

--
-- TOC entry 502 (class 1259 OID 31608)
-- Name: pcr_assay_in_time; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.pcr_assay_in_time AS
 WITH tbl_pp AS (
         SELECT DISTINCT pp.primer_set,
            pp.primer_name
           FROM datahub_0.pcr_primers pp
          WHERE (pp.primer_set = ANY (ARRAY['Tombuloglu-set'::datahub_0.type_primerset, 'Young-set'::datahub_0.type_primerset, 'Won-set'::datahub_0.type_primerset, 'Niu-set'::datahub_0.type_primerset, 'Sarkar-set'::datahub_0.type_primerset, 'Lu-set'::datahub_0.type_primerset, 'DMSC-set'::datahub_0.type_primerset, 'Chan-set'::datahub_0.type_primerset, 'Shirato-set'::datahub_0.type_primerset, 'Huang-set'::datahub_0.type_primerset, 'Yip-set'::datahub_0.type_primerset, 'Mollaei-set'::datahub_0.type_primerset, 'IP-set'::datahub_0.type_primerset, 'Chu-set'::datahub_0.type_primerset, 'Davi-set'::datahub_0.type_primerset, 'Corman-set'::datahub_0.type_primerset]))
        ), tbl_sys AS (
         SELECT pp.primer_set,
            count(1) AS all_system_numbers
           FROM tbl_pp pp
          GROUP BY pp.primer_set
        ), tbl_empty AS (
         SELECT foo1.primer_set,
            'slight_chance'::text AS missclass_level,
            '0'::text AS ct,
            (generate_series(('2019-12-01'::date)::timestamp with time zone, now(), '1 day'::interval))::date AS collection_date
           FROM ( SELECT DISTINCT pp.primer_set
                   FROM tbl_pp pp) foo1
        UNION ALL
         SELECT foo2.primer_set,
            'susceptible'::text AS missclass_level,
            '0'::text AS ct,
            (generate_series(('2019-12-01'::date)::timestamp with time zone, now(), '1 day'::interval))::date AS collection_date
           FROM ( SELECT DISTINCT pp.primer_set
                   FROM tbl_pp pp) foo2
        ), tbl_tr AS (
         SELECT par.collection_date,
            par.runid,
            par.primer_set,
            par.primer_name AS primer,
            par.primer_type,
                CASE
                    WHEN (((count(
                    CASE
                        WHEN (par.risk_pos = 0) THEN 1
                        ELSE NULL::integer
                    END) + count(
                    CASE
                        WHEN (par.risk_pos = 1) THEN 1
                        ELSE NULL::integer
                    END)) > 2) OR (count(
                    CASE
                        WHEN (par.risk_pos = 1) THEN 1
                        ELSE NULL::integer
                    END) > 0)) THEN 1
                    ELSE 0
                END AS risky_sample
           FROM datahub_0.pcr_assay_results par
          GROUP BY par.collection_date, par.runid, par.primer_set, par.primer_name, par.primer_type
        ), tbl_system AS (
         SELECT tbl_tr.collection_date,
            tbl_tr.runid,
            tbl_tr.primer_set,
            tbl_tr.primer
           FROM tbl_tr
          WHERE (tbl_tr.risky_sample = 1)
          GROUP BY tbl_tr.collection_date, tbl_tr.runid, tbl_tr.primer_set, tbl_tr.primer
        ), tbl_set AS (
         SELECT tbl_system.collection_date,
            tbl_system.runid,
            tbl_system.primer_set,
            count(1) AS systems_number
           FROM tbl_system
          GROUP BY tbl_system.collection_date, tbl_system.runid, tbl_system.primer_set
          ORDER BY (count(1)) DESC
        ), tbl_base AS (
         SELECT ts.collection_date,
            ts.primer_set,
            ts.systems_number,
            ty.all_system_numbers,
            count(1) AS nos,
                CASE
                    WHEN ((ts.systems_number)::numeric < ((ty.all_system_numbers)::numeric * 0.5)) THEN 'slight_chance'::text
                    WHEN ((ts.systems_number)::numeric >= ((ty.all_system_numbers)::numeric * 0.5)) THEN 'susceptible'::text
                    ELSE 'None'::text
                END AS missclass_level
           FROM (tbl_set ts
             JOIN tbl_sys ty ON (((ts.primer_set)::text = (ty.primer_set)::text)))
          GROUP BY ts.collection_date, ts.primer_set, ts.systems_number, ty.all_system_numbers
          ORDER BY ts.primer_set
        ), tbl_base2 AS (
         SELECT te.collection_date,
            te.primer_set,
            te.missclass_level,
                CASE
                    WHEN (ts.nos IS NULL) THEN (0)::bigint
                    ELSE ts.nos
                END AS nos
           FROM (tbl_base ts
             RIGHT JOIN tbl_empty te ON (((ts.collection_date = te.collection_date) AND ((ts.primer_set)::text = (te.primer_set)::text) AND (ts.missclass_level = te.missclass_level))))
        ), tbl_empty2 AS (
         SELECT '0'::text AS ct,
            (generate_series(('2019-12-01'::date)::timestamp with time zone, now(), '1 day'::interval))::date AS collection_date
        ), tbl_all AS (
         SELECT meta.collection_date,
            count(DISTINCT v1.runid) AS allpos_count
           FROM (datahub_0.n_content v1
             JOIN datahub_0.human_metadata meta ON ((meta.runid = v1.runid)))
          WHERE (v1.quality_status = 'good'::datahub_0.type_quality)
          GROUP BY meta.collection_date
        ), tbl_all2 AS (
         SELECT tbl_empty2.collection_date,
                CASE
                    WHEN (tbl_all.allpos_count IS NULL) THEN (0)::bigint
                    ELSE tbl_all.allpos_count
                END AS allpos_count2
           FROM (tbl_all
             RIGHT JOIN tbl_empty2 ON ((tbl_all.collection_date = tbl_empty2.collection_date)))
        ), tbl_end AS (
         SELECT tbl_base2.collection_date,
            tbl_base2.primer_set,
            tbl_base2.missclass_level,
                CASE
                    WHEN ((tbl_all2.allpos_count2 IS NULL) OR (tbl_all2.allpos_count2 = 0)) THEN (0)::double precision
                    ELSE (((tbl_base2.nos)::double precision / (tbl_all2.allpos_count2)::double precision) * (100)::double precision)
                END AS rel
           FROM (tbl_base2
             JOIN tbl_all2 ON ((tbl_all2.collection_date = tbl_base2.collection_date)))
        ), tbl_moving AS (
         SELECT fo.collection_date,
            fo.primer_set,
            fo.missclass_level,
            fo.rel,
            avg(fo.rel) OVER (PARTITION BY fo.missclass_level, fo.primer_set ORDER BY fo.missclass_level, fo.primer_set, fo.collection_date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS day30_avg
           FROM tbl_end fo
        )
 SELECT date_trunc('week'::text, (foo.collection_date)::timestamp with time zone) AS week,
    foo.primer_set,
    foo.missclass_level,
    avg(foo.day30_avg) AS week_avg
   FROM tbl_moving foo
  GROUP BY (date_trunc('week'::text, (foo.collection_date)::timestamp with time zone)), foo.primer_set, foo.missclass_level
  ORDER BY (date_trunc('week'::text, (foo.collection_date)::timestamp with time zone)), foo.primer_set, foo.missclass_level
  WITH NO DATA;


ALTER TABLE datahub_0.pcr_assay_in_time OWNER TO public_loader;

--
-- TOC entry 338 (class 1259 OID 25942)
-- Name: reference_genome; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.reference_genome (
    pos integer NOT NULL,
    na character(1)
);


ALTER TABLE datahub_0.reference_genome OWNER TO public_loader;

--
-- TOC entry 233 (class 1259 OID 16720)
-- Name: runid_id_seq; Type: SEQUENCE; Schema: datahub_0; Owner: public_loader
--

CREATE SEQUENCE datahub_0.runid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datahub_0.runid_id_seq OWNER TO public_loader;

--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 233
-- Name: runid_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub_0; Owner: public_loader
--

ALTER SEQUENCE datahub_0.runid_id_seq OWNED BY datahub_0.runid.id;


--
-- TOC entry 335 (class 1259 OID 25752)
-- Name: unique_cov; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.unique_cov (
    runid integer NOT NULL,
    insertion_ts timestamp without time zone,
    snapshot character varying(32),
    integrity datahub_0.type_integrity
);


ALTER TABLE datahub_0.unique_cov OWNER TO public_loader;

--
-- TOC entry 269 (class 1259 OID 17145)
-- Name: runid_ok; Type: VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE VIEW datahub_0.runid_ok AS
 SELECT uc.runid
   FROM (datahub_0.unique_cov uc
     JOIN datahub_0.unique_vcf uv ON (((uc.runid = uv.runid) AND (uc.integrity = uv.integrity))))
  WHERE (uc.integrity = 'ok'::datahub_0.type_integrity);


ALTER TABLE datahub_0.runid_ok OWNER TO public_loader;

--
-- TOC entry 285 (class 1259 OID 17319)
-- Name: summary_insert; Type: VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE VIEW datahub_0.summary_insert AS
 SELECT foo.snapshot,
    foo.count AS coverage_count,
    foo.load_start AS coverage_start_insert,
    foo.load_duration AS coverage_duration_insert,
    bar.count AS vcf_count,
    bar.load_start AS vcf_start_insert,
    bar.load_duration AS vcf_duration_insert
   FROM (( SELECT (regexp_replace((uc.snapshot)::text, '_coverage.*'::text, ''::text))::character varying(32) AS snapshot,
            count(*) AS count,
            min(uc.insertion_ts) AS load_start,
            (max(uc.insertion_ts) - min(uc.insertion_ts)) AS load_duration
           FROM datahub_0.unique_cov uc
          GROUP BY uc.snapshot) foo
     FULL JOIN ( SELECT (regexp_replace((uv.snapshot)::text, '_vcf.*'::text, ''::text))::character varying(32) AS snapshot,
            count(*) AS count,
            min(uv.insertion_ts) AS load_start,
            (max(uv.insertion_ts) - min(uv.insertion_ts)) AS load_duration
           FROM datahub_0.unique_vcf uv
          GROUP BY uv.snapshot) bar ON (((foo.snapshot)::text = (bar.snapshot)::text)))
  ORDER BY foo.load_start;


ALTER TABLE datahub_0.summary_insert OWNER TO public_loader;

--
-- TOC entry 273 (class 1259 OID 17207)
-- Name: test_background_sample_counts; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.test_background_sample_counts AS
 SELECT dbplyr_008.collection_date,
    dbplyr_008.country_name AS country,
    dbplyr_008.n AS count
   FROM ( SELECT "LHS".collection_date,
            "LHS".country_id,
            "LHS".n,
            "RHS".iso_a3,
            "RHS".iso_a2,
            "RHS".country_name,
            "RHS".country_name_local,
            "RHS".population_2021
           FROM (( SELECT dbplyr_007.collection_date,
                    dbplyr_007.country_id,
                    count(*) AS n
                   FROM ( SELECT "LHS_1".runid,
                            "LHS_1".ena_run,
                            "RHS_1".collection_date,
                            "RHS_1".collection_date_valid,
                            "RHS_1".country_id,
                            "RHS_1".host_id,
                            "RHS_1".host_sex,
                            "RHS_1".instrument_id,
                            "RHS_1".sample_accession,
                            "RHS_1".study_accession,
                            "RHS_1".experiment_accession
                           FROM (( SELECT "LHS_2".runid,
                                    "RHS_2".ena_run
                                   FROM (datahub_0.runid_ok "LHS_2"
                                     LEFT JOIN datahub_0.runid "RHS_2" ON (("LHS_2".runid = "RHS_2".id)))) "LHS_1"
                             LEFT JOIN datahub_0.metadata "RHS_1" ON (("LHS_1".runid = "RHS_1".runid)))) dbplyr_007
                  GROUP BY dbplyr_007.collection_date, dbplyr_007.country_id) "LHS"
             LEFT JOIN datahub_0.country "RHS" ON (("LHS".country_id = "RHS".id)))) dbplyr_008
  WITH NO DATA;


ALTER TABLE datahub_0.test_background_sample_counts OWNER TO public_loader;

--
-- TOC entry 271 (class 1259 OID 17165)
-- Name: unique_ena_run_summary; Type: MATERIALIZED VIEW; Schema: datahub_0; Owner: public_loader
--

CREATE MATERIALIZED VIEW datahub_0.unique_ena_run_summary AS
 SELECT 'vcf'::text AS table_name,
    count(*) AS count
   FROM ( SELECT DISTINCT vk.runid
           FROM datahub_0.vcf_key vk) tmp1
UNION
 SELECT 'cov'::text AS table_name,
    count(*) AS count
   FROM ( SELECT DISTINCT c.runid
           FROM datahub_0.cov c
          WHERE (c.pos = 1)) tmp2
UNION
 SELECT 'meta'::text AS table_name,
    count(*) AS count
   FROM ( SELECT DISTINCT m.runid
           FROM datahub_0.metadata m) tmp3
  WITH NO DATA;


ALTER TABLE datahub_0.unique_ena_run_summary OWNER TO public_loader;

--
-- TOC entry 255 (class 1259 OID 16918)
-- Name: vcf_lof; Type: TABLE; Schema: datahub_0; Owner: public_loader
--

CREATE TABLE datahub_0.vcf_lof (
    key bigint,
    lof datahub_0.type_lof
);


ALTER TABLE datahub_0.vcf_lof OWNER TO public_loader;

--
-- TOC entry 4242 (class 2604 OID 16742)
-- Name: collector id; Type: DEFAULT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.collector ALTER COLUMN id SET DEFAULT nextval('datahub_0.collector_id_seq'::regclass);


--
-- TOC entry 4241 (class 2604 OID 16733)
-- Name: country id; Type: DEFAULT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.country ALTER COLUMN id SET DEFAULT nextval('datahub_0.country_id_seq'::regclass);


--
-- TOC entry 4243 (class 2604 OID 16751)
-- Name: host id; Type: DEFAULT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.host ALTER COLUMN id SET DEFAULT nextval('datahub_0.host_id_seq'::regclass);


--
-- TOC entry 4244 (class 2604 OID 16758)
-- Name: instrument id; Type: DEFAULT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.instrument ALTER COLUMN id SET DEFAULT nextval('datahub_0.instrument_id_seq'::regclass);


--
-- TOC entry 4245 (class 2604 OID 16767)
-- Name: library id; Type: DEFAULT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.library ALTER COLUMN id SET DEFAULT nextval('datahub_0.library_id_seq'::regclass);


--
-- TOC entry 4240 (class 2604 OID 16724)
-- Name: runid id; Type: DEFAULT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.runid ALTER COLUMN id SET DEFAULT nextval('datahub_0.runid_id_seq'::regclass);


--
-- TOC entry 4253 (class 2606 OID 16746)
-- Name: collector collector_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.collector
    ADD CONSTRAINT collector_pkey PRIMARY KEY (id);


--
-- TOC entry 4251 (class 2606 OID 16737)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 4267 (class 2606 OID 16821)
-- Name: gene_id gene_id_gene_id_key; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.gene_id
    ADD CONSTRAINT gene_id_gene_id_key UNIQUE (gene_id);


--
-- TOC entry 4255 (class 2606 OID 16753)
-- Name: host host_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.host
    ADD CONSTRAINT host_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 16762)
-- Name: instrument instrument_instrument_platform_instrument_model_key; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.instrument
    ADD CONSTRAINT instrument_instrument_platform_instrument_model_key UNIQUE (instrument_platform, instrument_model);


--
-- TOC entry 4259 (class 2606 OID 16760)
-- Name: instrument instrument_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (id);


--
-- TOC entry 4261 (class 2606 OID 16769)
-- Name: library library_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.library
    ADD CONSTRAINT library_pkey PRIMARY KEY (id);


--
-- TOC entry 4263 (class 2606 OID 16774)
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (runid);


--
-- TOC entry 4265 (class 2606 OID 16801)
-- Name: metaextension metaextension_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metaextension
    ADD CONSTRAINT metaextension_pkey PRIMARY KEY (runid);


--
-- TOC entry 4290 (class 2606 OID 31555)
-- Name: pcr_primers pcr_assay_webpage_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.pcr_primers
    ADD CONSTRAINT pcr_assay_webpage_pkey PRIMARY KEY (id);


--
-- TOC entry 4288 (class 2606 OID 25946)
-- Name: reference_genome reference_genome_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.reference_genome
    ADD CONSTRAINT reference_genome_pkey PRIMARY KEY (pos);


--
-- TOC entry 4247 (class 2606 OID 16728)
-- Name: runid runid_ena_run_key; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.runid
    ADD CONSTRAINT runid_ena_run_key UNIQUE (ena_run);


--
-- TOC entry 4249 (class 2606 OID 16726)
-- Name: runid runid_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.runid
    ADD CONSTRAINT runid_pkey PRIMARY KEY (id);


--
-- TOC entry 4269 (class 2606 OID 25948)
-- Name: amino_acid_symbol u_symb3; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.amino_acid_symbol
    ADD CONSTRAINT u_symb3 UNIQUE (symbol_3letter);


--
-- TOC entry 4286 (class 2606 OID 25756)
-- Name: unique_cov unique_cov_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.unique_cov
    ADD CONSTRAINT unique_cov_pkey PRIMARY KEY (runid);


--
-- TOC entry 4271 (class 2606 OID 16872)
-- Name: unique_vcf unique_vcf_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.unique_vcf
    ADD CONSTRAINT unique_vcf_pkey PRIMARY KEY (runid);


--
-- TOC entry 4274 (class 2606 OID 28647)
-- Name: vcf_key vcf_key_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.vcf_key
    ADD CONSTRAINT vcf_key_pkey PRIMARY KEY (key);


--
-- TOC entry 4278 (class 2606 OID 28633)
-- Name: vcf vcf_pkey; Type: CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.vcf
    ADD CONSTRAINT vcf_pkey PRIMARY KEY (key);


--
-- TOC entry 4284 (class 1259 OID 17390)
-- Name: cpvspos; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX cpvspos ON datahub_0.cov_s_pos USING btree (pos_aa);


--
-- TOC entry 4279 (class 1259 OID 30336)
-- Name: idx_annotation_genename; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX idx_annotation_genename ON datahub_0.annotation USING btree (gene_name);


--
-- TOC entry 4280 (class 1259 OID 30335)
-- Name: idx_annotation_hgvsp; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX idx_annotation_hgvsp ON datahub_0.annotation USING btree (hgvs_p);


--
-- TOC entry 4281 (class 1259 OID 30337)
-- Name: idx_annotation_key; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX idx_annotation_key ON datahub_0.annotation USING btree (key);


--
-- TOC entry 4275 (class 1259 OID 30324)
-- Name: idx_vcf_af; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX idx_vcf_af ON datahub_0.vcf USING btree (af);


--
-- TOC entry 4276 (class 1259 OID 30323)
-- Name: idx_vcf_key; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX idx_vcf_key ON datahub_0.vcf USING btree (key);


--
-- TOC entry 4272 (class 1259 OID 30311)
-- Name: idx_vcf_key_runid; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX idx_vcf_key_runid ON datahub_0.vcf_key USING btree (runid);


--
-- TOC entry 4282 (class 1259 OID 17205)
-- Name: n_content_runid; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX n_content_runid ON datahub_0.n_content USING btree (runid);


--
-- TOC entry 4283 (class 1259 OID 17212)
-- Name: test_background_sample_counts_collection_date; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX test_background_sample_counts_collection_date ON datahub_0.test_background_sample_counts USING btree (collection_date);


--
-- TOC entry 4291 (class 1259 OID 31581)
-- Name: vcf_key_selected_idx_; Type: INDEX; Schema: datahub_0; Owner: public_loader
--

CREATE INDEX vcf_key_selected_idx_ ON datahub_0.vcf_key_selected USING btree (key);


--
-- TOC entry 4301 (class 2606 OID 30330)
-- Name: annotation_binding annotation_binding_key_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.annotation_binding
    ADD CONSTRAINT annotation_binding_key_fkey FOREIGN KEY (key) REFERENCES datahub_0.vcf_key(key);


--
-- TOC entry 4303 (class 2606 OID 30338)
-- Name: annotation annotation_key_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.annotation
    ADD CONSTRAINT annotation_key_fkey FOREIGN KEY (key) REFERENCES datahub_0.vcf_key(key);


--
-- TOC entry 4307 (class 2606 OID 25952)
-- Name: codon_code codon_code_aa_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.codon_code
    ADD CONSTRAINT codon_code_aa_fkey FOREIGN KEY (aa) REFERENCES datahub_0.amino_acid_symbol(symbol_3letter);


--
-- TOC entry 4305 (class 2606 OID 30158)
-- Name: cov cov_runid_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.cov
    ADD CONSTRAINT cov_runid_fkey FOREIGN KEY (runid) REFERENCES datahub_0.unique_cov(runid);


--
-- TOC entry 4308 (class 2606 OID 29461)
-- Name: jhd_covid_country_weekly jhd_covid_country_weekly_country_id_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.jhd_covid_country_weekly
    ADD CONSTRAINT jhd_covid_country_weekly_country_id_fkey FOREIGN KEY (country_id) REFERENCES datahub_0.country(id);


--
-- TOC entry 4292 (class 2606 OID 16780)
-- Name: metadata metadata_country_id_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metadata
    ADD CONSTRAINT metadata_country_id_fkey FOREIGN KEY (country_id) REFERENCES datahub_0.country(id);


--
-- TOC entry 4293 (class 2606 OID 16785)
-- Name: metadata metadata_host_id_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metadata
    ADD CONSTRAINT metadata_host_id_fkey FOREIGN KEY (host_id) REFERENCES datahub_0.host(id);


--
-- TOC entry 4294 (class 2606 OID 16790)
-- Name: metadata metadata_instrument_id_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metadata
    ADD CONSTRAINT metadata_instrument_id_fkey FOREIGN KEY (instrument_id) REFERENCES datahub_0.instrument(id);


--
-- TOC entry 4295 (class 2606 OID 16775)
-- Name: metadata metadata_runid_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metadata
    ADD CONSTRAINT metadata_runid_fkey FOREIGN KEY (runid) REFERENCES datahub_0.runid(id);


--
-- TOC entry 4296 (class 2606 OID 16812)
-- Name: metaextension metaextension_collector_id_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metaextension
    ADD CONSTRAINT metaextension_collector_id_fkey FOREIGN KEY (collector_id) REFERENCES datahub_0.collector(id);


--
-- TOC entry 4297 (class 2606 OID 16807)
-- Name: metaextension metaextension_library_id_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metaextension
    ADD CONSTRAINT metaextension_library_id_fkey FOREIGN KEY (library_id) REFERENCES datahub_0.library(id);


--
-- TOC entry 4298 (class 2606 OID 16802)
-- Name: metaextension metaextension_runid_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.metaextension
    ADD CONSTRAINT metaextension_runid_fkey FOREIGN KEY (runid) REFERENCES datahub_0.runid(id);


--
-- TOC entry 4309 (class 2606 OID 31556)
-- Name: pcr_primers pcr_assay_webpage_country_id_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.pcr_primers
    ADD CONSTRAINT pcr_assay_webpage_country_id_fkey FOREIGN KEY (country_id) REFERENCES datahub_0.country(id);


--
-- TOC entry 4306 (class 2606 OID 25762)
-- Name: unique_cov unique_cov_runid_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.unique_cov
    ADD CONSTRAINT unique_cov_runid_fkey FOREIGN KEY (runid) REFERENCES datahub_0.runid(id);


--
-- TOC entry 4299 (class 2606 OID 16873)
-- Name: unique_vcf unique_vcf_runid_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.unique_vcf
    ADD CONSTRAINT unique_vcf_runid_fkey FOREIGN KEY (runid) REFERENCES datahub_0.runid(id);


--
-- TOC entry 4302 (class 2606 OID 30318)
-- Name: vcf vcf_key_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.vcf
    ADD CONSTRAINT vcf_key_fkey FOREIGN KEY (key) REFERENCES datahub_0.vcf_key(key);


--
-- TOC entry 4300 (class 2606 OID 30306)
-- Name: vcf_key vcf_key_runid_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.vcf_key
    ADD CONSTRAINT vcf_key_runid_fkey FOREIGN KEY (runid) REFERENCES datahub_0.unique_vcf(runid);


--
-- TOC entry 4304 (class 2606 OID 30325)
-- Name: vcf_lof vcf_lof_key_fkey; Type: FK CONSTRAINT; Schema: datahub_0; Owner: public_loader
--

ALTER TABLE ONLY datahub_0.vcf_lof
    ADD CONSTRAINT vcf_lof_key_fkey FOREIGN KEY (key) REFERENCES datahub_0.vcf_key(key);


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 24
-- Name: SCHEMA datahub_0; Type: ACL; Schema: -; Owner: public_loader
--

GRANT USAGE ON SCHEMA datahub_0 TO public_reader;


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE amino_acid_symbol; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.amino_acid_symbol TO public_reader;


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE annotation; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.annotation TO public_reader;


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE vcf; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.vcf TO public_reader;


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE vcf_key; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.vcf_key TO public_reader;


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 467
-- Name: TABLE _bc_stg1; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0._bc_stg1 TO public_reader;


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 468
-- Name: TABLE _bc_stg2; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0._bc_stg2 TO public_reader;


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 469
-- Name: TABLE barcode; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.barcode TO public_reader;


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE country; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.country TO public_reader;


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE metadata; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.metadata TO public_reader;


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE runid; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.runid TO public_reader;


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 470
-- Name: TABLE aa_mutation; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.aa_mutation TO public_reader;


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE annotation_binding; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.annotation_binding TO public_reader;


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE metaextension; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.metaextension TO public_reader;


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 444
-- Name: TABLE human_metadata; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.human_metadata TO public_reader;


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 445
-- Name: TABLE app_country_samples_full; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.app_country_samples_full TO public_reader;


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 479
-- Name: TABLE app_human_meta_mv; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.app_human_meta_mv TO public_reader;


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 448
-- Name: TABLE jhd_covid_country_weekly; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.jhd_covid_country_weekly TO public_reader;


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 480
-- Name: TABLE app_human_meta_mv_jhd; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.app_human_meta_mv_jhd TO public_reader;


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE lineage_def; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.lineage_def TO public_reader;


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE unique_vcf; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.unique_vcf TO public_reader;


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE variant_mutations; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.variant_mutations TO public_reader;


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 446
-- Name: TABLE lineage; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.lineage TO public_reader;


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 447
-- Name: TABLE app_lineage; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.app_lineage TO public_reader;


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 449
-- Name: TABLE app_new_cases_jhd; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.app_new_cases_jhd TO public_reader;


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 450
-- Name: TABLE app_variants_weekly; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.app_variants_weekly TO public_reader;


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE codon_code; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.codon_code TO public_reader;


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE collector; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.collector TO public_reader;


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE cov; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.cov TO public_reader;


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE cov_s_pos; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.cov_s_pos TO public_reader;


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE gene_id; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.gene_id TO public_reader;


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE host; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.host TO public_reader;


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE instrument; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.instrument TO public_reader;


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE library; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.library TO public_reader;


--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE n_content; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.n_content TO public_reader;


--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 497
-- Name: TABLE pcr_primers; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.pcr_primers TO public_reader;


--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 498
-- Name: TABLE pcr_webpage; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.pcr_webpage TO public_reader;


--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 499
-- Name: TABLE vcf_key_selected; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.vcf_key_selected TO public_reader;


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 500
-- Name: TABLE pcr_assay_results_webpage; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.pcr_assay_results_webpage TO public_reader;


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 501
-- Name: TABLE pcr_assay_results; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.pcr_assay_results TO public_reader;


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 502
-- Name: TABLE pcr_assay_in_time; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.pcr_assay_in_time TO public_reader;


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE reference_genome; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.reference_genome TO public_reader;


--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 335
-- Name: TABLE unique_cov; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.unique_cov TO public_reader;


--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE runid_ok; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.runid_ok TO public_reader;


--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE summary_insert; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.summary_insert TO public_reader;


--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE test_background_sample_counts; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.test_background_sample_counts TO public_reader;


--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE unique_ena_run_summary; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.unique_ena_run_summary TO public_reader;


--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE vcf_lof; Type: ACL; Schema: datahub_0; Owner: public_loader
--

GRANT SELECT ON TABLE datahub_0.vcf_lof TO public_reader;


-- Completed on 2024-03-06 15:07:26 CET

--
-- PostgreSQL database dump complete
--

