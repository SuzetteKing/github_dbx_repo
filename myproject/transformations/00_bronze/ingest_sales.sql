CREATE OR REFRESH STREAMING TABLE myproject_pipeline.bronze.raw_sales
AS
SELECT
  sls_ord_num,
  sls_prd_key,
  sls_cust_id,
  sls_order_dt,
  sls_ship_dt,
  sls_due_dt,
  sls_sales,
  sls_quantity,
  sls_price,
   current_timestamp() AS ingestion_timestamp,
  _metadata.file_path AS source_file
FROM STREAM read_files(
  '/Volumes/myproject_pipeline/bronze/landing/prd_info',
  format => 'csv',
  header => true,
  schema => 'sls_ord_num STRING, sls_prd_key STRING, sls_cust_id STRING, sls_order_dt
 DATE, sls_ship_dt DATE, sls_due_dt DATE, sls_sales DOUBLE, sls_quantity DOUBLE, sls_price LONG'
);
