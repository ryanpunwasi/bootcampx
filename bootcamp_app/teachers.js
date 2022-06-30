const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const query = `SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohorts
FROM assistance_requests 
JOIN teachers ON (teacher_id = teachers.id)
JOIN students ON (student_id = students.id)
JOIN cohorts ON (students.cohort_id = cohorts.id)
WHERE cohorts.name LIKE $1
ORDER BY teacher;`;

const cohort = process.argv[2];

pool.query(query, [`%${cohort}%`])
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohorts}: ${row.teacher}`);
  });
  pool.end();
}).catch(err => console.error('query error', err.stack));