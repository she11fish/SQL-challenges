# Write your MySQL query statement below
-- Solved it using JOIN
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits
LEFT JOIN Transactions
ON Visits.visit_id = Transactions.visit_id
WHERE Transactions.transaction_id is NULL
GROUP BY customer_id;

-- Solved without using JOIN
SELECT customer_id, COUNT(customer_id) AS 'count_no_trans' 
FROM Visits 
WHERE visit_id 
NOT IN (SELECT visit_id FROM Transactions) 
GROUP BY customer_id;