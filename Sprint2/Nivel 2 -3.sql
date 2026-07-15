SELECT 
    co.company_name, 
    COUNT(t.id) AS transaciones,
    CASE 
        WHEN COUNT(t.id) >= 400 THEN 'Igual o más de 400 transaciones'
        ELSE 'Menos de 400 transaciones'
    END AS clasificacion_ventas
FROM companies AS co
JOIN transactions AS t ON co.company_id = t.business_id
GROUP BY co.company_id, co.company_name
ORDER BY transaciones DESC;
