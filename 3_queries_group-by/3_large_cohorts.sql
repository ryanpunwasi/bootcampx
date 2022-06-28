SELECT cohorts.name as cohort_name, COUNT(*) as student_count
FROM cohorts 
JOIN students ON students.cohort_id = cohorts.id
GROUP BY cohort_name
HAVING COUNT(*) >= 18
ORDER BY student_count ASC;