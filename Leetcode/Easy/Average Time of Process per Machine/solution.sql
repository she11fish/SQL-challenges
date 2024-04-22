# Write your MySQL query statement below
SELECT machine_id, ROUND(AVG(end - start), 3) as processing_time FROM (SELECT A.machine_id, A.timestamp AS start, B.timestamp AS end 
FROM Activity AS A 
INNER JOIN Activity AS B 
ON A.machine_id = B.machine_id AND A.process_id = B.process_id
WHERE A.activity_type = "start" AND B.activity_type = "end") AS checkpoint GROUP BY machine_id;