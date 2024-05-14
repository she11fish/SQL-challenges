# Write your MySQL query statement below
SELECT 
    ROUND(COALESCE(SUM(
        CASE WHEN 
            (DATE_ADD(first_login, INTERVAL 1 DAY), player_id) IN (SELECT event_date, player_id FROM Activity) 
        THEN 1       
        ELSE NULL END), 0) / COUNT(DISTINCT player_id), 2) AS fraction
FROM
    (SELECT event_date, player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id) as A