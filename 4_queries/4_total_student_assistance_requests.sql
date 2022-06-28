SELECT COUNT(assistance_requests.*) as total_requests, name 
FROM students 
INNER JOIN assistance_requests ON (students.id = student_id)
WHERE students.name = 'Elliot Dickinson'
GROUP BY name;