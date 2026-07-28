SELECT co.company_name, co.phone, co.country, DATE(t.time_stamp), t.amount
FROM companies AS co
JOIN transactions AS t
ON t.business_id = co.company_id
WHERE t.amount >350 AND t.amount <400 AND
DATE(time_stamp) IN ('2015-04-29', '2018-07-20', '2024-03-13')
ORDER BY amount ASC;
