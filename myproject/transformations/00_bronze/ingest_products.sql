CREATE OR REFRESH STREAMING TABLE myproject_pipeline.bronze.raw_products
AS
SELECT
  prd_id,
  prd_key,
  prd_nm,
  prd_cost,
  prd_line,
  prd_start_dt,
  prd_end_dt,
   current_timestamp() AS ingestion_timestamp,
  _metadata.file_path AS source_file
FROM STREAM read_files(
  '/Volumes/myproject_pipeline/bronze/landing/prd_info',
  format => 'csv',
  header => true,
  schema => 'prd_id STRING, prd_key STRING, prd_nm STRING, prd_cost LONG, prd_line STRING, prd_start_dt DATE, prd_end_dt DATE'
);
