SELECT l1.login_date,
ROUND(COUNT(DISTINCT l2.user_id)*1.0/COUNT(DISTINCT l1.user_id),2) AS retention_rate
FROM Logins l1 
LEFT JOIN Logins l2
ON l1.user_id = l2.user_id
AND l2.login_date = DATE_ADD(l1.login_date,INTERVAL 1 DAY)
GROUP BY l1.login_date;