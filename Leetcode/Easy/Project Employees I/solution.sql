# Write your MySQL query statement below
SELECT 
    Project.project_id, 
    COALESCE(ROUND(SUM(experience_years) /
    COUNT(Employee.employee_id), 2), 0) AS average_years
FROM 
    Project
JOIN
    Employee
ON
    Project.employee_id = Employee.employee_id
WHERE experience_years IS NOT NULL
GROUP BY
    project_id;