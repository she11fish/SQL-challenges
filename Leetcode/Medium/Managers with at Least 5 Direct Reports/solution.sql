# Write your MySQL query statement below
SELECT 
  name 
FROM 
  (
    SELECT 
      Employee.name, 
      ManagerReports.managerId, 
      ManagerReports.report_count 
    FROM 
      (
        SELECT 
          Employee.name, 
          Employee.managerId, 
          COUNT(*) AS report_count 
        FROM 
          Employee 
        GROUP BY 
          Employee.managerId
      ) AS ManagerReports 
      JOIN Employee ON ManagerReports.managerId = Employee.id 
    WHERE 
      ManagerReports.report_count >= 5
  ) as C;
