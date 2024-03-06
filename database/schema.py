
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
CREATE TABLE IF NOT EXISTS {schema}.mergeinfo (
    tablename                   VARCHAR(64),
    task                        VARCHAR(32),
    records                     INT,
    start                       TIMESTAMP,
    stop                        TIMESTAMP,
    mergeinfo                   VARCHAR(64)
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
    key                         BIGINT PRIMARY KEY,
    runid                       INT REFERENCES {schema}.runid(id),
    pos                         INT NOT NULL,
    ref                         TEXT NOT NULL,
    alt                         TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.annotation_binding (
    key                         BIGINT REFERENCES {schema}.vcf_key(key),
    gene_name                   {schema}.type_genename,
    annotation_atom             {schema}.type_annotation_atom
);
CREATE TABLE IF NOT EXISTS {schema}.vcf (
    key                         BIGINT PRIMARY KEY REFERENCES {schema}.vcf_key(key),
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
    key                         BIGINT REFERENCES {schema}.vcf_key(key),
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
    key                         BIGIINT REFERENCES {schema}.vcf_key(key),
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
    key                         BIGINT PRIMARY KEY,
    runid                       INT REFERENCES {schema}.unique_vcf(runid),
    pos                         INT NOT NULL,
    ref                         TEXT NOT NULL,
    alt                         TEXT
);
CREATE TABLE IF NOT EXISTS {schema}.annotation_binding (
    key                         BIGINT REFERENCES {schema}.vcf_key(key),
    gene_name                   {schema}.type_genename,
    annotation_atom             {schema}.type_annotation_atom
);
CREATE TABLE IF NOT EXISTS {schema}.vcf (
    key                         BIGINT PRIMARY KEY REFERENCES {schema}.vcf_key(key),
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
    key                         BIGINT REFERENCES {schema}.vcf_key(key),
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
    key                         BIGINT REFERENCES {schema}.vcf_key(key),
    lof                         {schema}.type_lof
);
"""

tables_load =  """
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_unique_cov (
        runid                       int,
        insertion_ts                TIMESTAMP,
        snapshot                    VARCHAR(32) NOT NULL,
        integrity                   {schema}.type_integrity NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_cov (
    runid                       int,
    pos                         int,               -- Position in the sequence
    coverage                    int                -- Coverage in the given position
);
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_unique_vcf (
        runid                       int,
        insertion_ts                TIMESTAMP,
        snapshot                    VARCHAR(32) NOT NULL,
        integrity                   {schema}.type_integrity NOT NULL
);
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_vcf_key (
    key                         bigint,
    runid                       int,
    pos                         INT NOT NULL,
    ref                         TEXT NOT NULL,
    alt                         TEXT
);
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_annotation_binding (
    key                         bigint,
    gene_name                   {schema}.type_genename,
    annotation_atom             {schema}.type_annotation_atom
);
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_vcf (
    key                         bigint,
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
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_annotation (
    key                         bigint,
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
CREATE TABLE IF NOT EXISTS {schema_load}.{prefix}_vcf_lof (
    key                         bigint,
    lof                         {schema}.type_lof
);
"""

