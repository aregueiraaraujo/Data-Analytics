SELECT COUNT(t.id) AS total_transactions, t.user_id
	FROM transactions t
    WHERE t.user_id IN  (SELECT U.id FROM users u)
    GROUP BY t.user_id
	HAVING total_transactions > 80 AND user_id IS NOT NULL
    ORDER BY total_transactions DESC
