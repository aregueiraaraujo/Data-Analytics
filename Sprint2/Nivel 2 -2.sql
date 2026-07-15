SELECT co.company_name, co.phone, co.country, t.time_stamp, t.amount
FROM companies AS co
JOIN transactions AS t
ON t.business_id = co.company_id
WHERE t.amount >350 AND t.amount <400 AND (
CAST(time_stamp AS DATE) = '2015-04-29' 
OR CAST(time_stamp AS DATE) = '2018-07-20' 
OR CAST(time_stamp AS DATE) = '2024-03-13')
ORDER BY amount ASC;
