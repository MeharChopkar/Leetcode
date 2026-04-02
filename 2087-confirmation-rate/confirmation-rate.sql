SELECT 
    s.user_id,
    ROUND(
        IFNULL(
            COUNT(c.action = 'confirmed' OR NULL) / COUNT(c.action),
        0),
    2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;