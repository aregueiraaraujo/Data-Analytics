WITH Calculo_ventas AS (
  SELECT 
    date AS Fecha,
    total_sales AS Ventas_Hoy,
    LAG(total_sales) OVER (ORDER BY date) AS Ventas_Ayer
  FROM `sprint3-analytics-alexregueira.sprint3_gold.mv_daily_sales`
)

SELECT 
  Fecha,
  ROUND(Ventas_Hoy, 2) AS Ventas_Hoy,
  ROUND(Ventas_Ayer, 2) AS Ventas_vs_Ayer,
  ROUND((Ventas_Hoy - Ventas_Ayer) / Ventas_Ayer * 100, 2) AS Diff_Percentual
FROM Calculo_Ventas
ORDER BY Fecha DESC;