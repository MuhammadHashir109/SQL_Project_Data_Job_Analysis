
/*
This SQL query identifies the top 25 most in-demand skills for Data Analyst positions that allow remote work and are associated with the highest average salaries. It uses Common Table Expressions (CTEs) to calculate both the demand for each skill and the average salary, then combines these results to rank the skills accordingly.
*/





WITH skill_demand AS (
    SELECT 
      skills_dim.skill_id,
      skills_dim.skills,
      COUNT(*) AS skill_count
FROM job_postings_fact
        INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
        INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
        WHERE job_title_short = 'Data Analyst'
            AND job_work_from_home =  TRUE
            AND salary_year_avg IS NOT NULL
        GROUP BY skills_dim.skill_id
        ORDER BY skill_count DESC
),average_salary AS (
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
ORDER BY average_salary DESC
)
SELECT 
    skill_demand.skill_id,
    skill_demand.skills,
    skill_demand.skill_count,
    average_salary.average_salary
FROM skill_demand
INNER JOIN average_salary ON average_salary.skill_id = skill_demand.skill_id
ORDER BY average_salary DESC,
            skill_demand.skill_count DESC
LIMIT 25;   