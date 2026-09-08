SELECT * 
FROM `sprint3-analytics-alexregueira.sprint3_gold.v_marketing_kpis`
ORDER BY 
   CASE WHEN client_tier = 'Premium' THEN 0 ELSE 1 END,
   avg_purchase DESC;
