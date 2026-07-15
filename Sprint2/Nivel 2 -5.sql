CREATE VIEW VistaMarketing AS
SELECT co.company_name, co.phone, co.country, media_de_compra 
FROM companies AS co
JOIN (
    SELECT business_id, ROUND(AVG(t.amount),2) AS media_de_compra
    FROM transactions AS t
    GROUP BY business_id
) t ON  t.business_id = co.company_id
ORDER BY media_de_compra DESC;
SELECT * FROM VistaMarketing;
