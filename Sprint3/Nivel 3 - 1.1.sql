CREATE OR REPLACE VIEW  `sprint3-analytics-alexregueira.sprint3_gold.v_marketing_kpis` AS
SELECT 
   co.company_name,
   co.phone,
   co.country,
   AVG(t.amount) AS avg_purchase,
   CASE
      WHEN AVG(t.amount) > 260 THEN 'Premium'
      ELSE 'Standard'
   END AS client_tier
FROM `sprint3-analytics-alexregueira.sprint3_silver.companies_clean` AS co
JOIN `sprint3-analytics-alexregueira.sprint3_silver.transactions_clean` AS t
   ON t.business_id = co.company_id
GROUP BY co.company_name, co.phone, co.country;
