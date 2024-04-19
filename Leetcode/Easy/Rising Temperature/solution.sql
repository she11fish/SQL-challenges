# Write your MySQL query statement below
SELECT B.id 
FROM Weather AS A 
RIGHT JOIN Weather AS B
ON A.temperature < B.temperature
WHERE A.recordDate = DATE_SUB(B.recordDate, INTERVAL 1 DAY);