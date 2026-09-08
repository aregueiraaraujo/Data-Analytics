SELECT table_name, table_type
FROM `sprint3-analytics-alexregueira.sprint3_silver`.INFORMATION_SCHEMA.TABLES
WHERE table_name IN ('companies_clean', 'credit_cards_clean');
   
