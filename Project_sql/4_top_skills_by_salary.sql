/*
This SQL query retrieves the top 25 skills associated with the highest average salaries for Data Analyst positions
that allow remote work. It joins the job_postings_fact table with the skills_job_dim and skills_dim tables to calculate the average salary for each skill and ranks them accordingly.
*/

SELECT 
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skills_dim.skills
ORDER BY average_salary DESC
LIMIT 25;