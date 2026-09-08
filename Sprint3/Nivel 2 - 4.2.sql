CREATE OR REPLACE TABLE `sprint3-analytics-alexregueira.sprint3_silver.companies_clean` AS 
SELECT 
   id AS card_id,
   user_id,
   iban,
   pan,   
   pin,  
   cvv,
   track1,
   track2,
   expiration_date
FROM `sprint3-analytics-alexregueira.sprint3_bronze.credit_cards_raw`;
   
