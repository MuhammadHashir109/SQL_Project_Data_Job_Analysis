/* 
    This query retrieves the top 5 most demanding skills for Data Analyst positions that allow remote work. 
    It joins the job_postings_fact table with the skills_job_dim and 
    skills_dim tables to count the occurrences of each skill in relevant job postings.
*/

SELECT 
      skills_dim.skills,
            COUNT(*) AS skill_count
FROM job_postings_fact
        INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
        INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
        WHERE job_title_short = 'Data Analyst'
            AND job_work_from_home =  TRUE
        GROUP BY skills_dim.skills
        ORDER BY skill_count DESC
        LIMIT 5;
    