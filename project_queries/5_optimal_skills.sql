/*
Question : What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 20
ORDER BY
    avg_salary DESC,
    demand_count DESC 
LIMIT 25

/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023:
The trends highlighted by these skills suggest that the role of a data analyst
in 2023 is becoming increasingly complex and integrated with various technologies.
The demand for cloud computing, big data, and advanced programming languages indicates
a shift towards more technical and scalable solutions.
Meanwhile, the importance of data visualization and business intelligence tools
emphasizes the need for data analysts to not only analyze data but also present it in an accessible and impactful way.
Additionally, the enduring relevance of traditional database management and office productivity tools shows that
a well-rounded skill set is crucial for success in this evolving field.

1. Cloud Computing and Big Data Technologies:
Skills: Hadoop, Snowflake, Azure, AWS, Oracle

2. Programming Languages:
Skills: Go, Python, R

3. Data Visualization and Business Intelligence:
Skills: Looker, Tableau, Power BI

4. Database Management:
Skills: SQL, SQL Server, SPSS, SAS

5. Automation and Workflow Management:
Skills: Flow, VBA

6. Office Productivity Tools:
Skills: Excel, PowerPoint, Word, Sheets

7. Emergence of Go (Golang):
Skill: Go

[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "110",
    "avg_salary": "97431"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "398",
    "avg_salary": "97237"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "28",
    "avg_salary": "97200"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": "24",
    "avg_salary": "92170"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "24",
    "avg_salary": "88783"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "58",
    "avg_salary": "88701"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "256",
    "avg_salary": "87288"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "32",
    "avg_salary": "86088"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "48",
    "avg_salary": "82576"
  }
]
*/