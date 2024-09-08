/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Identify the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/


SELECT
    skills,
    COUNT(job_postings_fact.job_id) as demand_count
FROM  job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short LIKE 'Data Analyst'  AND job_work_from_home is TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5


/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL is the most in-demand skill, significantly leading the others.
Excel and Python also have high demand, indicating a strong preference for these skills in data analysis roles.
Tableau and Power BI are highly valued, reflecting the importance of data visualization tools in the industry.


[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/