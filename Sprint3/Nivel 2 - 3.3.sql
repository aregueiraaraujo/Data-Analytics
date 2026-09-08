SELECT origin, COUNT(*) AS total
FROM `sprint3-analytics-alexregueira.sprint3_silver.users_combined`
GROUP BY origin;
