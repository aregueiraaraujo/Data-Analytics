CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_silver.users_combined` AS
SELECT
   id AS user_id,
   name,
   surname,
   phone,
   email,
   birth_date,
   country,
   city,
   postal_code,
   address,
  'EE.UU.' AS origin
FROM `sprint3-analytics-alexregueira.sprint3_bronze.american_useres_raw`

UNION ALL

SELECT
   id AS user_id,
   name,
   surname,
   phone,
   email,
   birth_date,
   country,
   city,
   postal_code,
   address,
  'Europa.' AS origin
FROM `sprint3-analytics-alexregueira.sprint3_bronze.european_useres_raw`
