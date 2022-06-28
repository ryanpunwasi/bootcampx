SELECT students.name, AVG(assignment_submissions.duration) AS average
FROM students 
JOIN assignment_submissions ON (students.id = student_id)
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY AVG(assignment_submissions.duration) DESC;