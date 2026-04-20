SELECT 
    quarter1_jobs.job_title_short,
    quarter1_jobs.job_posted_date,
    quarter1_jobs.job_location,
    quarter1_jobs.job_via
FROM (
                SELECT *
                FROM january_jobs
                UNION ALL
                SELECT *
                FROM february_jobs
                UNION ALL
                SELECT *
                FROM march_jobs
            ) AS quarter1_jobs
        WHERE job_title_short = 'Data Analyst' AND quarter1_jobs.salary_year_avg > 70000
