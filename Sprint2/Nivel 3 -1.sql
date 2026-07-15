WITH UltimasTransacciones AS (
    SELECT card_id, declined,
        ROW_NUMBER() OVER (PARTITION BY card_id ORDER BY time_stamp DESC) AS rn
    FROM transactions
),
EstadoTarjetas AS (
    SELECT card_id, SUM(declined) AS total_rechazos, COUNT(*) AS total_transacciones
    FROM UltimasTransacciones
    WHERE rn <= 3
    GROUP BY card_id
),
TablaFinal AS (
    SELECT card_id,
        CASE WHEN total_transacciones = 3 AND total_rechazos = 3 THEN 'inactivo' 
		ELSE 'activo' 
        END AS estado
    FROM EstadoTarjetas
)
SELECT COUNT(*) AS tarjetas_activas
FROM TablaFinal
WHERE estado = 'activo';
