WITH VIP_Stats AS (
  SELECT
    user_id, 
    CONCAT(name, ' ', surname) AS nome_completo,
    email
  FROM `sprint3-analytics-alexregueira.sprint3_silver.users_combined` AS u
)

SELECT
  v.user_id,
  v.nome_completo, 
  v.email, 
  COUNT(transaction_id) AS num_compras, 
  ROUND(AVG(amount),2) AS ticket_medio, 
  ROUND(MAX(amount),2) AS max_compra, 
  ROUND(SUM(amount),2) AS total_gastado
FROM `sprint3-analytics-alexregueira.sprint3_silver.transactions_clean` AS t
JOIN VIP_Stats AS v
ON t.user_id = v.user_id
WHERE t.declined = 0
GROUP BY 
  v.user_id, 
  v.nome_completo, 
  v.email
HAVING total_gastado > 500
ORDER BY total_gastado DESC;
