SELECT ROUND(COUNT(DISTINCT l2.user_id)*1.0/COUNT(DISTINCT l1.user_id),2) AS retention_rate
FROM logins l1
LEFT JOIN logins l2 
ON l1.user_id = l2.user_id
AND l2.login_date = DATE_ADD(l1.login_date,INTERVAL 1 DAY)
WHERE l1.login_date = '2023-10-01';