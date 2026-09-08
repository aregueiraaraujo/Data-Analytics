CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_silver.transactions_clean` AS
SELECT 
   id AS transaction_id,
   card_id,
   business_id,
   SAFE_CAST(timestamp AS TIMESTAMP) AS timestamp,
   IFNULL(SAFE_CAST(amount AS FLOAT64), 0) AS amount,
   declined,
   ARRAY(
      SELECT CAST(TRIM(x) AS INT64)
      FROM UNNEST(SPLIT(product_ids, ',')) AS x
   ) AS product_ids,
   user_id,
   SAFE_CAST(lat AS FLOAT64) AS lat,
   SAFE_CAST(longitude AS FLOAT64) AS longitude
FROM `sprint3-analytics-alexregueira.sprint3_bronze.transactions_raw`;