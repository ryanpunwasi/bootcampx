SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_duration
FROM assistance_requests 
JOIN students ON (student_id = students.id)
JOIN cohorts ON (cohorts.id = students.cohort_id)
GROUP BY cohort
ORDER BY total_duration;