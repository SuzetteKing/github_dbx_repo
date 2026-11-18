CREATE OR REFRESH STREAMING TABLE myproject_pipeline.bronze.raw_customers
AS
SELECT
  cst_id,
  cst_key,
  cst_firstname,
  cst_lastname,
  cst_marital_status,
  cst_gndr,
  cst_create_date,
   current_timestamp() AS ingestion_timestamp,
  _metadata.file_path AS source_file
FROM STREAM read_files(
  '/Volumes/myproject_pipeline/bronze/landing/cust_info',
  format => 'csv',
  header => true,
  schema => 'cst_id STRING, cst_key STRING, cst_firstname STRING, cst_lastname STRING, cst_marital_status STRING, cst_gndr STRING, cst_create_date DATE'
);
