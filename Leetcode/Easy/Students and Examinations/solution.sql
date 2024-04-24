# Write your MySQL query statement below
SELECT Students.student_id, Students.student_name, Subjects.subject_name, COALESCE(ExamCounts.attended_exams, 0) as attended_exams
FROM Students
JOIN 
    (SELECT DISTINCT subject_name FROM Subjects) AS Subjects
LEFT JOIN 
    (SELECT 
        student_id, 
        subject_name, 
        COUNT(*) AS attended_exams
        FROM 
            Examinations
        GROUP BY 
            student_id, 
            subject_name) AS ExamCounts 
    ON Students.student_id = ExamCounts.student_id
        AND Subjects.subject_name = ExamCounts.subject_name
ORDER BY Students.student_id, Subjects.subject_name;