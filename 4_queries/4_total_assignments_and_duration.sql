SELECT assignments.day, COUNT(*), SUM(duration)
FROM assignments
GROUP BY assignments.day
ORDER BY assignments.day;