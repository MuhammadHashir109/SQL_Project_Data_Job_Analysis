-- Find the top 5 skills with the most remote job postings for the role of Data Analyst.

WITH remote_jobs AS (
SELECT
    skill_id,
    COUNT(*) AS job_count
FROM skills_job_dim
INNER JOIN  job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_work_from_home = True AND job_title_short = 'Data Analyst'
GROUP BY skill_id)
SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    remote_jobs.job_count
FROM remote_jobs
INNER JOIN skills_dim ON skills_dim.skill_id = remote_jobs.skill_id
ORDER BY job_count DESC
LIMIT 5;   