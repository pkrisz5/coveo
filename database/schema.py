
enum_types = {
    'type_sex': ['male', 'female'],
    'type_layout': ['single', 'paired'],
    'type_status': [
        'active surveillance in response to outbreak', 
        'active surveillance not initiated by an outbreak', 
        'other'
    ],
    'type_integrity': ['ok', 'empty file', 'corrupt file'],
    'type_nmd': ['(ORF1ab|GU280_gp01|1|1.00)', '(ORF1ab|GU280_gp01|28|0.04)'],
    'type_featuretype': ['intergenic_region', 'transcript', 'gene_variant'],
    'type_rank': ['1/1', '2/2', '1/2'],
    'type_transcriptbiotype': ['protein_coding'],
    'type_annotationimpact': ['HIGH', 'MODERATE', 'LOW', 'MODIFIER'],
    'type_quality': ['bad', 'good', 'mediocre'],
    'type_annotation_atom': [
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
    ],
    'type_lof': [
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
    ],
    'type_genename': [
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
	'ORF6&ORF8'
    ],
    'type_featureid': [
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
    ],
}

tables_common = """
CREATE TABLE IF NOT EXISTS {schema}.merge_log (
    mergeinfo                   VARCHAR(64),
    tablename                   VARCHAR(64),
    task                        VARCHAR(32),
    start                       TIMESTAMP,
    stop                        TIMESTAMP
);
CREATE TABLE IF NOT EXISTS {schema}.runid (
    id                          SERIAL PRIMARY KEY,
    ena_run                     VARCHAR(16) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.country (
    id                                SERIAL PRIMARY KEY,
    iso_a3                            CHAR(3),
    iso_a2                            CHAR(2),
    country_name                      VARCHAR(64),
    country_name_local                TEXT,
    population_2021                   INT
);
CREATE TABLE IF NOT EXISTS {schema}.collector (
        id                SERIAL PRIMARY KEY,
        broker_name       VARCHAR(64) NULL,
        collected_by      TEXT NULL,
        center_name       TEXT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.host (
        id                SERIAL PRIMARY KEY,
        host              VARCHAR(128) NOT NULL,
        tax_id            int
);
CREATE TABLE IF NOT EXISTS {schema}.instrument (
        id                    SERIAL PRIMARY KEY,
        instrument_platform   VARCHAR(16) NOT NULL,
        instrument_model      VARCHAR(32) NOT NULL,
        UNIQUE (instrument_platform, instrument_model)
);
CREATE TABLE IF NOT EXISTS {schema}.library (
        id                  SERIAL PRIMARY KEY,
        layout              {schema}.type_layout NOT NULL,
        source              VARCHAR(32),
        selection           VARCHAR(32),
        strategy            VARCHAR(32)
        -- FIXME: UNIQUE () ?
);
CREATE TABLE IF NOT EXISTS {schema}.metadata (
        runid                       INT PRIMARY KEY REFERENCES {schema}.runid(id),
        collection_date             DATE NULL,
        collection_date_valid       BOOL,
        country_id                  INT REFERENCES {schema}.country(id) NULL,
        host_id                     INT REFERENCES {schema}.host(id) NULL,
        host_sex                    {schema}.type_sex DEFAULT NULL,
        instrument_id               INT REFERENCES {schema}.instrument(id) NULL,
        sample_accession            VARCHAR(16),
        study_accession             VARCHAR(16),
        experiment_accession        VARCHAR(16)
);
CREATE TABLE IF NOT EXISTS {schema}.metaextension (
        runid                       INT PRIMARY KEY REFERENCES {schema}.runid(id),
        description                 TEXT NULL,
        fastq_ftp                   TEXT,
        isolate                     VARCHAR(128) NULL,
        sample_capture_status       {schema}.type_status NULL,
        strain                      VARCHAR(128),
        checklist                   VARCHAR(16),
        base_count                  DOUBLE PRECISION,
        library_name                VARCHAR(128),
        library_id                  INT REFERENCES {schema}.library(id) NULL,
        first_created               DATE,
        first_public                DATE NULL,
        collector_id                INT REFERENCES {schema}.collector(id),
        country_raw                 TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.gene_id (
        gene_id             VARCHAR(32) UNIQUE NOT NULL,
        gene_name           {schema}.type_genename NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.lineage_def (
    variant_id             text,
    pango                  text,
    type_variant           text,
    amino_acid_change      text,
    protein_codon_position int,
    ref_protein            text,
    alt_protein            text,
    gene                   text,
    effect                 text,
    snpeff_original_mut    text,
    ref_pos_alt            text,
    ref                    text,
    alt                    text,
    pos                    int,
    description            text
);
CREATE TABLE IF NOT EXISTS {schema}.primer_artic_v3 (
    chrom       CHAR(10), 
    p_start     INT, 
    p_end       INT, 
    name        VARCHAR(32), 
    primerpool  INT, 
    strand      CHAR(1), 
    sequence    TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.primer_artic_v4 (
    chrom       CHAR(10), 
    p_start     INT, 
    p_end       INT, 
    name        VARCHAR(32), 
    primerpool  INT, 
    strand      CHAR(1), 
    sequence    TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.pcr_primers (
    target_gene                VARCHAR(8),
    origin                     VARCHAR(16),
    country_id                 INT REFERENCES {schema}.country(id) NULL,
    type                       VARCHAR(8), 
    primer_name                VARCHAR(16), 
    primer_set                 VARCHAR(16),
    original_primer_name       VARCHAR(32), 
    target_sequence            TEXT, 
    target_sequence_start_pos  INT,
    target_sequence_end_pos    INT, 
    primer_size_bp             INT, 
    reference_genome           VARCHAR(16),
    update_time                DATE, 
    doi                        VARCHAR(48), 
    reference                  VARCHAR(32), 
    other_reference            VARCHAR(32)  -- FIXME: ez gusztustalan oszlop, kell?
);
CREATE TABLE IF NOT EXISTS {schema}.amino_acid_symbol (
    name                VARCHAR(16),
    symbol_3letter      CHAR(3),
    symbol_1letter      CHAR(1)
);
CREATE TABLE IF NOT EXISTS {schema}.lamp_primers (
    target_gene                  VARCHAR(8), 
    origin                       VARCHAR(32), 
    country_id                   INT REFERENCES {schema}.country(id) NULL,
    cat_type                     VARCHAR(8), 
    primer_set                   VARCHAR(16),
    primer_name                  VARCHAR(16), 
    primer_name_type             VARCHAR(20), 
    type                         CHAR(1), 
    original_primer_name         VARCHAR(16),
    primer_sequence_5_3          TEXT, 
    target_sequence_start_pos    INT,
    target_sequence_end_pos      INT, 
    primer_size_bp               INT, 
    reference_genome             VARCHAR(16),
    update_time                  DATE, 
    doi                          VARCHAR(32), 
    reference                    VARCHAR(32)
);
CREATE TABLE IF NOT EXISTS {schema}.ecdc_covid_country_weekly (
    country_id                        INT REFERENCES {schema}.country(id) NULL,
    population                        INT,
    date_year                         INT,
    date_week                         INT,
    cases                             INT,
    deaths                            INT
);
CREATE TABLE IF NOT EXISTS {schema}.unique_vcf (
        runid                       INT PRIMARY KEY REFERENCES {schema}.runid(id),
        insertion_ts                TIMESTAMP,
        snapshot                    VARCHAR(32) NOT NULL,
        integrity                   {schema}.type_integrity NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.vcf_key (
    key                         INT PRIMARY KEY,
    runid                       INT REFERENCES {schema}.runid(id),
    pos                         INT NOT NULL,
    ref                         TEXT NOT NULL,
    alt                         TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.annotation_binding (
    key                         INT REFERENCES {schema}.vcf_key(key),
    gene_name                   {schema}.type_genename,
    annotation_atom             {schema}.type_annotation_atom
);
CREATE TABLE IF NOT EXISTS {schema}.vcf (
    key                         INT PRIMARY KEY REFERENCES {schema}.vcf_key(key),
    qual                        INT,
    dp                          INT,
    af                          REAL,
    sb                          INT,
    count_ref_forward_base      INT,
    count_ref_reverse_base      INT,
    count_alt_forward_base      INT,
    count_alt_reverse_base      INT,
    hrun                        INT,
    indel                       BOOLEAN,
    nmd                         {schema}.type_nmd,
    major                       BOOLEAN,
    ann_num                     INT
);
CREATE TABLE IF NOT EXISTS {schema}.annotation (
    key                         INT REFERENCES {schema}.vcf_key(key),
    annotation_impact           {schema}.type_annotationimpact,
    gene_name                   {schema}.type_genename,
    feature_type                {schema}.type_featuretype,
    feature_id                  {schema}.type_featureid,
    transcript_biotype          {schema}.type_transcriptbiotype,
    rank_                       {schema}.type_rank,
    hgvs_c                      TEXT,
    hgvs_p                      TEXT,
    cdna_pos                    INT,
    cdna_length                 INT,
    cds_pos                     INT,
    cds_length                  INT,
    aa_pos                      INT,
    aa_length                   INT,
    distance                    INT,
    errors_warnings_info        TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.vcf_lof (
    key                         INT REFERENCES {schema}.vcf_key(key),
    lof                         {schema}.type_lof
);
CREATE TABLE IF NOT EXISTS {schema}.unique_cov (
        runid                       INT PRIMARY KEY REFERENCES {schema}.runid(id),
        insertion_ts                TIMESTAMP,
        snapshot                    VARCHAR(32) NOT NULL,
        integrity                   {schema}.type_integrity NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.cov (
    runid                       INT REFERENCES {schema}.unique_cov(runid),
    pos                         int,               -- Position in the sequence
    coverage                    int                -- Coverage in the given position
);
CREATE TABLE IF NOT EXISTS {schema}.unique_vcf (
        runid                       INT PRIMARY KEY REFERENCES {schema}.runid(id),
        insertion_ts                TIMESTAMP,
        snapshot                    VARCHAR(32) NOT NULL,
        integrity                   {schema}.type_integrity NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.vcf_key (
    key                         INT PRIMARY KEY,
    runid                       INT REFERENCES {schema}.unique_vcf(runid),
    pos                         INT NOT NULL,
    ref                         TEXT NOT NULL,
    alt                         TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.annotation_binding (
    key                         INT REFERENCES {schema}.vcf_key(key),
    gene_name                   {schema}.type_genename,
    annotation_atom             {schema}.type_annotation_atom
);
CREATE TABLE IF NOT EXISTS {schema}.vcf (
    key                         INT PRIMARY KEY REFERENCES {schema}.vcf_key(key),
    qual                        INT,
    dp                          INT,
    af                          REAL,
    sb                          INT,
    count_ref_forward_base      INT,
    count_ref_reverse_base      INT,
    count_alt_forward_base      INT,
    count_alt_reverse_base      INT,
    hrun                        INT,
    indel                       BOOLEAN,
    nmd                         {schema}.type_nmd,
    major                       BOOLEAN,
    ann_num                     INT
);
CREATE TABLE IF NOT EXISTS {schema}.annotation (
    key                         INT REFERENCES {schema}.vcf_key(key),
    annotation_impact           {schema}.type_annotationimpact,
    gene_name                   {schema}.type_genename,
    feature_type                {schema}.type_featuretype,
    feature_id                  {schema}.type_featureid,
    transcript_biotype          {schema}.type_transcriptbiotype,
    rank_                       {schema}.type_rank,
    hgvs_c                      TEXT,
    hgvs_p                      TEXT,
    cdna_pos                    INT,
    cdna_length                 INT,
    cds_pos                     INT,
    cds_length                  INT,
    aa_pos                      INT,
    aa_length                   INT,
    distance                    INT,
    errors_warnings_info        TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.vcf_lof (
    key                         INT REFERENCES {schema}.vcf_key(key),
    lof                         {schema}.type_lof
);
CREATE TABLE IF NOT EXISTS {schema}.jhd_covid_country_weekly (
    country_id                        INT REFERENCES {schema}.country(id) NULL,
    date_year                         INT,
    date_week                         INT,
    cases                             INT
);
"""

tables_load =  """
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_unique_cov (
        runid                       int,
        insertion_ts                TIMESTAMP,
        snapshot                    VARCHAR(32) NOT NULL,
        integrity                   {schema}.type_integrity NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_cov (
    runid                       int,
    pos                         int,               -- Position in the sequence
    coverage                    int                -- Coverage in the given position
);
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_unique_vcf (
        runid                       int,
        insertion_ts                TIMESTAMP,
        snapshot                    VARCHAR(32) NOT NULL,
        integrity                   {schema}.type_integrity NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_vcf_key (
    key                         int,
    runid                       int,
    pos                         INT NOT NULL,
    ref                         TEXT NOT NULL,
    alt                         TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_annotation_binding (
    key                         int,
    gene_name                   {schema}.type_genename,
    annotation_atom             {schema}.type_annotation_atom
);
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_vcf (
    key                         int,
    qual                        INT,
    dp                          INT,
    af                          REAL,
    sb                          INT,
    count_ref_forward_base      INT,
    count_ref_reverse_base      INT,
    count_alt_forward_base      INT,
    count_alt_reverse_base      INT,
    hrun                        INT,
    indel                       BOOLEAN,
    nmd                         {schema}.type_nmd,
    major                       BOOLEAN,
    ann_num                     INT
);
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_annotation (
    key                         int,
    annotation_impact           {schema}.type_annotationimpact,
    gene_name                   {schema}.type_genename,
    feature_type                {schema}.type_featuretype,
    feature_id                  {schema}.type_featureid,
    transcript_biotype          {schema}.type_transcriptbiotype,
    rank_                       {schema}.type_rank,
    hgvs_c                      TEXT,
    hgvs_p                      TEXT,
    cdna_pos                    INT,
    cdna_length                 INT,
    cds_pos                     INT,
    cds_length                  INT,
    aa_pos                      INT,
    aa_length                   INT,
    distance                    INT,
    errors_warnings_info        TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.{prefix}_vcf_lof (
    key                         int,
    lof                         {schema}.type_lof
);
"""

views = """
CREATE OR REPLACE VIEW {schema}.summary_insert
AS SELECT foo.snapshot,
    foo.count AS coverage_count,
    foo.load_start AS coverage_start_insert,
    foo.load_duration AS coverage_duration_insert,
    bar.count AS vcf_count,
    bar.load_start AS vcf_start_insert,
    bar.load_duration AS vcf_duration_insert
   FROM ( SELECT uc.snapshot,
            count(*) AS count,
            min(uc.insertion_ts) AS load_start,
            max(uc.insertion_ts) - min(uc.insertion_ts) AS load_duration
           FROM {schema}.unique_cov uc
          GROUP BY uc.snapshot) foo
     FULL JOIN ( SELECT uv.snapshot,
            count(*) AS count,
            min(uv.insertion_ts) AS load_start,
            max(uv.insertion_ts) - min(uv.insertion_ts) AS load_duration
           FROM {schema}.unique_vcf uv
          GROUP BY uv.snapshot) bar ON foo.snapshot::text = bar.snapshot::text
  ORDER BY foo.load_start;
  
CREATE OR REPLACE VIEW {schema}.runid_ok
AS SELECT uc.runid
   FROM {schema}.unique_cov uc
     JOIN {schema}.unique_vcf uv ON uc.runid = uv.runid AND uc.integrity = uv.integrity
  WHERE uc.integrity = 'ok'::{schema}.type_integrity;
  
CREATE OR REPLACE VIEW {schema}.variant_mutations
AS SELECT ld.variant_id,
    count(*) AS mutations
   FROM {schema}.lineage_def ld
  GROUP BY ld.variant_id;
"""

indexes = """
CREATE INDEX idx_vcf_key_runid ON {schema}.vcf_key USING btree (runid);
CREATE INDEX idx_vcf_key ON {schema}.vcf USING btree (key);
CREATE INDEX idx_vcf_af ON {schema}.vcf USING btree (af);
CREATE INDEX idx_annotation_hgvsp ON {schema}.annotation USING btree (hgvs_p);
CREATE INDEX idx_annotation_genename ON {schema}.annotation USING btree (gene_name);
CREATE INDEX idx_annotation_key ON {schema}.annotation USING btree (key);
"""

materialized_views = """
CREATE MATERIALIZED VIEW {schema}.aa_mutation
TABLESPACE pg_default
AS WITH a_s_aac AS (
         SELECT a.key,
            a.hgvs_p
           FROM {schema}.annotation a
          WHERE a.hgvs_p IS NOT NULL AND char_length(a.hgvs_p) = char_length(replace(a.hgvs_p, '_'::text, ''::text)) AND "substring"(a.hgvs_p, 3, 3) <> "substring"(a.hgvs_p, char_length(a.hgvs_p) - 2, 3) AND a.gene_name = 'S'::{schema}.type_genename AND ("substring"(a.hgvs_p, 3, 3) IN ( SELECT aas.symbol_3letter
                   FROM {schema}.amino_acid_symbol aas)) AND ("substring"(a.hgvs_p, char_length(a.hgvs_p) - 2, 3) IN ( SELECT aas.symbol_3letter
                   FROM {schema}.amino_acid_symbol aas))
        )
 SELECT c.country_name,
    c.iso_a3,
    m.country_id,
    m.collection_date,
    tmp.hgvs_p,
    r.ena_run,
    k.runid,
    v.af,
    v.major
   FROM {schema}.vcf v
     JOIN a_s_aac tmp ON tmp.key = v.key
     JOIN {schema}.vcf_key k ON k.key = tmp.key
     JOIN {schema}.runid r ON r.id = k.runid
     JOIN {schema}.metadata m ON m.runid = k.runid
     JOIN {schema}.country c ON c.id = m.country_id
  WHERE v.af > 0.5::double precision OR v.major
WITH DATA;
CREATE INDEX test_aa_mutation_countryid_ ON {schema}.aa_mutation USING btree (country_id);
CREATE INDEX test_aa_mutation_hgvs_p_ ON {schema}.aa_mutation USING btree (hgvs_p);
CREATE INDEX test_aa_mutation_runid_collectiondate_ ON {schema}.aa_mutation USING btree (runid, collection_date);

CREATE MATERIALIZED VIEW {schema}.app_new_cases_jhd
TABLESPACE pg_default
AS WITH tmp_meta1 AS (
         SELECT count(*) AS weekly_sample,
            m.country_id,
            date_part('isoyear'::text, m.collection_date) AS date_year,
            date_part('week'::text, m.collection_date) AS date_week
           FROM {schema}.metadata m
          WHERE m.collection_date_valid AND m.host_id = {schema}.host_human_id() AND m.collection_date > '2020-03-15'::date AND NOT m.country_id IS NULL
          GROUP BY m.country_id, (date_part('isoyear'::text, m.collection_date)), (date_part('week'::text, m.collection_date))
        )
 SELECT c.country_name AS country,
    to_date(t1.date_year::text || t1.date_week::text, 'iyyyiw'::text) AS date,
    t1.date_year,
    t1.date_week,
    t1.weekly_sample,
    jhdw.cases
   FROM tmp_meta1 t1
     LEFT JOIN {schema}.jhd_covid_country_weekly jhdw USING (country_id, date_year, date_week)
     JOIN {schema}.country c ON c.id = t1.country_id
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.app_country_samples
TABLESPACE pg_default
AS WITH temp_stat AS (
         SELECT m.country_id,
            count(*) AS n_sample
           FROM {schema}.metadata m
          WHERE m.host_id = {schema}.host_human_id() AND m.collection_date_valid
          GROUP BY m.country_id
        )
 SELECT c.country_name AS country,
    temp_stat.n_sample,
    log(temp_stat.n_sample::double precision) AS log_n_sample
   FROM temp_stat
     LEFT JOIN {schema}.country c ON c.id = temp_stat.country_id
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.app_country_samples_full
TABLESPACE pg_default
AS WITH temp_stat AS (
         SELECT m.country_id,
            count(*) AS n_sample
           FROM {schema}.metadata m
          WHERE m.host_id = {schema}.host_human_id() AND m.collection_date_valid
          GROUP BY m.country_id
        )
 SELECT c.country_name AS country,
    temp_stat.n_sample,
    round(log(temp_stat.n_sample::double precision)::numeric, 3) AS log_n_sample,
    round((temp_stat.n_sample::double precision / c.population_2021::double precision * 1000000::double precision)::numeric, 3) AS relative_n_sample,
    round(log(temp_stat.n_sample::double precision / c.population_2021::double precision * 1000000::double precision)::numeric, 3) AS relative_log_n_sample
   FROM temp_stat
     LEFT JOIN {schema}.country c ON c.id = temp_stat.country_id
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.app_human_meta_mv
TABLESPACE pg_default
AS WITH tmp AS (
         SELECT m.country_id,
            date_part('isoyear'::text, m.collection_date) AS date_year,
            date_part('week'::text, m.collection_date) AS date_week,
            count(*) AS weekly_sample
           FROM {schema}.metadata m
          WHERE m.host_id = {schema}.host_human_id() AND NOT m.collection_date IS NULL AND m.collection_date < CURRENT_DATE AND m.collection_date > to_date('2019-12-01'::text, 'YYYY-MM-DD'::text) AND NOT m.country_id IS NULL
          GROUP BY m.country_id, (date_part('isoyear'::text, m.collection_date)), (date_part('week'::text, m.collection_date))
        )
 SELECT c.country_name,
    to_date(tmp.date_year::text || tmp.date_week::text, 'iyyyiw'::text) AS date,
    tmp.date_year,
    tmp.date_week,
    tmp.weekly_sample
   FROM tmp
     JOIN {schema}.country c ON c.id = tmp.country_id
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.app_human_meta_mv_jhd
TABLESPACE pg_default
AS WITH tmp AS (
         SELECT m.country_id,
            date_part('isoyear'::text, m.collection_date) AS date_year,
            date_part('week'::text, m.collection_date) AS date_week,
            count(*) AS weekly_sample
           FROM {schema}.metadata m
          WHERE m.host_id = {schema}.host_human_id() AND NOT m.collection_date IS NULL AND m.collection_date < CURRENT_DATE AND m.collection_date > to_date('2020-03-15'::text, 'YYYY-MM-DD'::text) AND NOT m.country_id IS NULL
          GROUP BY m.country_id, (date_part('isoyear'::text, m.collection_date)), (date_part('week'::text, m.collection_date))
        ), tmp2 AS (
         SELECT country_1.country_name,
            tmp.date_year,
            tmp.date_week,
            tmp.weekly_sample
           FROM tmp
             JOIN {schema}.country country_1 ON country_1.id = tmp.country_id
        )
 SELECT tmp2.country_name,
    to_date(tmp2.date_year::text || tmp2.date_week::text, 'iyyyiw'::text) AS date,
    tmp2.date_year,
    tmp2.date_week,
    tmp2.weekly_sample,
    jhd_covid_country_weekly.cases,
    round(tmp2.weekly_sample::numeric / jhd_covid_country_weekly.cases::numeric * 100::numeric, 2) AS pct
   FROM {schema}.jhd_covid_country_weekly
     LEFT JOIN {schema}.country ON jhd_covid_country_weekly.country_id = country.id
     RIGHT JOIN tmp2 ON tmp2.country_name::text = country.country_name::text AND tmp2.date_year = jhd_covid_country_weekly.date_year::double precision AND tmp2.date_week = jhd_covid_country_weekly.date_week::double precision
  WHERE jhd_covid_country_weekly.cases <> 0
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.lineage
TABLESPACE pg_default
AS WITH lineage_not_analyzed_w AS (
         SELECT m.runid,
            'Not analysed yet'::text AS variant_id,
            0 AS n,
            0 AS required_mutation
           FROM {schema}.runid_ok ro
             RIGHT JOIN {schema}.metadata m ON ro.runid = m.runid
          WHERE ro.runid IS NULL
        ), lineage0_w AS (
         WITH lhs AS (
                 SELECT lhs_vcf.runid,
                    ld.variant_id,
                    count(*) AS n
                   FROM ( SELECT vk.key,
                            vk.runid,
                            vk.pos,
                            vk.ref,
                            vk.alt,
                            v.key,
                            v.qual,
                            v.dp,
                            v.af,
                            v.sb,
                            v.count_ref_forward_base,
                            v.count_ref_reverse_base,
                            v.count_alt_forward_base,
                            v.count_alt_reverse_base,
                            v.hrun,
                            v.indel,
                            v.nmd,
                            v.major,
                            v.ann_num
                           FROM {schema}.vcf_key vk
                             JOIN {schema}.vcf v ON vk.key = v.key
                          WHERE v.af > 0.5::double precision OR v.major) lhs_vcf(key, runid, pos, ref, alt, key_1, qual, dp, af, sb, count_ref_forward_base, count_ref_reverse_base, count_alt_forward_base, count_alt_reverse_base, hrun, indel, nmd, major, ann_num)
                     JOIN {schema}.lineage_def ld ON lhs_vcf.pos = ld.pos AND lhs_vcf.ref = ld.ref AND lhs_vcf.alt = ld.alt
                  GROUP BY lhs_vcf.runid, ld.variant_id
                )
         SELECT lhs.runid,
            lhs.variant_id,
            lhs.n,
            vm.mutations AS required_mutation
           FROM lhs
             LEFT JOIN {schema}.variant_mutations vm ON lhs.variant_id = vm.variant_id
          WHERE lhs.n = vm.mutations
        ), lineage_base_w AS (
         SELECT DISTINCT ON (lineage0_w.runid) lineage0_w.runid,
            lineage0_w.variant_id,
            lineage0_w.n,
            lineage0_w.required_mutation
           FROM lineage0_w
          ORDER BY lineage0_w.runid, lineage0_w.required_mutation DESC
        ), runids AS (
         SELECT DISTINCT vk.runid
           FROM {schema}.vcf_key vk
        ), lineage_other_w AS (
         SELECT DISTINCT runids.runid,
            'Other variant'::text AS variant_id,
            0 AS n,
            0 AS required_mutation
           FROM lineage_base_w
             RIGHT JOIN runids ON lineage_base_w.runid = runids.runid
          WHERE lineage_base_w.runid IS NULL
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
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.app_worldplot_data
TABLESPACE pg_default
AS WITH tmp_meta1 AS (
         SELECT count(*) AS weekly_sample,
            m.country_id,
            date_part('isoyear'::text, m.collection_date) AS date_year,
            date_part('week'::text, m.collection_date) AS date_week
           FROM {schema}.metadata m
          WHERE m.collection_date_valid AND m.host_id = {schema}.host_human_id() AND m.collection_date > '2020-03-15'::date AND NOT m.country_id IS NULL AND m.collection_date < 'now'::text::date
          GROUP BY m.country_id, (date_part('isoyear'::text, m.collection_date)), (date_part('week'::text, m.collection_date))
        )
 SELECT c.country_name AS country,
    tmp_meta1.date_year,
    tmp_meta1.date_week,
    tmp_meta1.weekly_sample
   FROM tmp_meta1
     JOIN {schema}.country c ON c.id = tmp_meta1.country_id
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.unique_ena_run_summary
TABLESPACE pg_default
AS SELECT 'vcf'::text AS table_name,
    count(*) AS count
   FROM ( SELECT DISTINCT vk.runid
           FROM {schema}.vcf_key vk) tmp1
UNION
 SELECT 'cov'::text AS table_name,
    count(*) AS count
   FROM ( SELECT DISTINCT c.runid
           FROM {schema}.cov c
          WHERE c.pos = 1) tmp2
UNION
 SELECT 'meta'::text AS table_name,
    count(*) AS count
   FROM ( SELECT DISTINCT m.runid
           FROM {schema}.metadata m) tmp3
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.app_lineage
TABLESPACE pg_default
AS WITH tmp_meta1 AS (
         SELECT count(*) AS n,
            m.collection_date,
            m.country_id,
            l.variant_id
           FROM {schema}.metadata m
             JOIN {schema}.lineage l ON l.runid = m.runid
          WHERE m.collection_date_valid AND m.collection_date > '2020-01-01'::date AND m.host_id = {schema}.host_human_id() AND NOT m.country_id IS NULL
          GROUP BY m.collection_date, m.country_id, l.variant_id
        ), temp_lineage2 AS (
         SELECT tmp_meta1.collection_date,
            tmp_meta1.country_id,
            count(*) AS n_all
           FROM tmp_meta1
          GROUP BY tmp_meta1.collection_date, tmp_meta1.country_id
        )
 SELECT t1.collection_date,
    c.country_name AS country,
    t1.variant_id,
    t1.n,
    temp_lineage2.n_all,
    t1.n::numeric / temp_lineage2.n_all::numeric * 100::numeric AS pct
   FROM tmp_meta1 t1
     JOIN temp_lineage2 USING (collection_date, country_id)
     JOIN {schema}.country c ON c.id = t1.country_id
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.app_variants_weekly
TABLESPACE pg_default
AS WITH tmp_meta1 AS (
         SELECT m.runid,
            m.country_id,
            m.collection_date,
            date_part('isoyear'::text, m.collection_date) AS date_year,
            date_part('week'::text, m.collection_date) AS date_week
           FROM {schema}.metadata m
          WHERE m.collection_date_valid AND m.host_id = {schema}.host_human_id() AND m.collection_date > '2020-03-15'::date AND NOT m.country_id IS NULL
        ), tmp_joined AS (
         SELECT count(*) AS weekly_variant_sample,
            tmp_meta1.country_id,
            tmp_meta1.date_year,
            tmp_meta1.date_week,
            l.variant_id
           FROM tmp_meta1
             JOIN {schema}.lineage l USING (runid)
          GROUP BY tmp_meta1.country_id, tmp_meta1.date_year, tmp_meta1.date_week, l.variant_id
        )
 SELECT c.country_name AS country,
    t.date_year,
    t.date_week,
    t.variant_id,
    t.weekly_variant_sample
   FROM tmp_joined t
     JOIN {schema}.country c ON c.id = t.country_id
WITH DATA;

CREATE MATERIALIZED VIEW {schema}.n_content
TABLESPACE pg_default
AS SELECT c.runid,
    count(c.pos) AS num_of_pos_with_cov_nothigher_10,
    count(c.pos)::numeric / 29903::numeric AS estimated_n_content,
        CASE
            WHEN (count(c.pos)::numeric / 29903::numeric) < 0.1 THEN 'good'::{schema}.type_quality
            WHEN (count(c.pos)::numeric / 29903::numeric) <= 0.3 AND (count(c.pos)::numeric / 29903::numeric) >= 0.1 THEN 'mediocre'::{schema}.type_quality
            WHEN (count(c.pos)::numeric / 29903::numeric) > 0.3 THEN 'bad'::{schema}.type_quality
            ELSE NULL::{schema}.type_quality
        END AS quality_status
   FROM {schema}.cov c
  WHERE c.coverage::numeric <= 10::numeric
  GROUP BY c.runid
WITH DATA;
CREATE INDEX n_content_runid ON {schema}.n_content USING btree (runid);

CREATE MATERIALIZED VIEW {schema}.vcf_key_gene_s_af_gt_05
TABLESPACE pg_default
AS SELECT v.key
   FROM {schema}.vcf v
     LEFT JOIN {schema}.annotation a ON v.key = a.key
  WHERE v.af > 0.5::double precision AND a.gene_name = 'S'::{schema}.type_genename
WITH DATA;
CREATE INDEX vcf_key_gene_s_af_gt_05_idx ON {schema}.vcf_key_gene_s_af_gt_05 USING btree (key);

CREATE MATERIALIZED VIEW {schema}.vcf_key_selected
TABLESPACE pg_default
AS SELECT tmp1.key,
    vk.runid,
    vk.pos,
    vk.ref,
    vk.alt
   FROM {schema}.vcf_key vk
     JOIN ( SELECT v.key
           FROM {schema}.vcf v
          WHERE v.af > 0.1::double precision) tmp1 ON vk.key = tmp1.key
WITH DATA;
CREATE INDEX vcf_key_selected_idx ON {schema}.vcf_key_selected USING btree (key);

CREATE MATERIALIZED VIEW {schema}.test_background_sample_counts
TABLESPACE pg_default
AS SELECT dbplyr_008.collection_date,
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
           FROM ( SELECT dbplyr_007.collection_date,
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
                           FROM ( SELECT "LHS_2".runid,
                                    "RHS_2".ena_run
                                   FROM {schema}.runid_ok "LHS_2"
                                     LEFT JOIN {schema}.runid "RHS_2" ON "LHS_2".runid = "RHS_2".id) "LHS_1"
                             LEFT JOIN {schema}.metadata "RHS_1" ON "LHS_1".runid = "RHS_1".runid) dbplyr_007
                  GROUP BY dbplyr_007.collection_date, dbplyr_007.country_id) "LHS"
             LEFT JOIN {schema}.country "RHS" ON "LHS".country_id = "RHS".id) dbplyr_008
WITH DATA;
CREATE INDEX test_background_sample_counts_collection_date ON {schema}.test_background_sample_counts USING btree (collection_date);

CREATE MATERIALIZED VIEW {schema}.cov_s_pos
TABLESPACE pg_default
AS SELECT DISTINCT c.runid,
    (c.pos - 21563) / 3 + 1 AS pos_aa
   FROM {schema}.cov c
  WHERE c.coverage <= 30 AND c.pos >= 21563 AND c.pos <= 25384
WITH DATA;
CREATE INDEX cpvspos ON {schema}.cov_s_pos USING btree (pos_aa);

"""
