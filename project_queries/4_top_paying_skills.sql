/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for remote Data Analyst positions
- Focuses on roles with specified salaries
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary_per_skill
FROM  job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short LIKE 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home is TRUE
GROUP BY
    skills
ORDER BY
    avg_salary_per_skill DESC
LIMIT 20



/*
Here's a breakdown of the results for top paying skills for Data Analysts:
The top-paying skills for data analysts are not just focused on traditional
data analysis but extend to big data, machine learning, DevOps, and specialized programming languages.
This indicates a trend where data analysts are expected to be versatile, with a strong understanding
of both the technical and operational aspects of data management.
The integration of cloud technologies, automation tools, and open-source platforms
into data analytics roles is also increasingly crucial, driving the demand for professionals with these skill sets.


1. Emergence of Big Data and Cloud Technologies:
 Top Skills: PySpark, Databricks, Elasticsearch, Kubernetes, Airflow

2. Integration with Machine Learning and AI Platforms:
Top Skills: Watson, DataRobot, Scikit-learn, Jupyter, Pandas, Numpy

3. Emphasis on DevOps and Continuous Integration/Deployment:
Top Skills: Bitbucket, GitLab, Jenkins, Linux

4. Focus on Programming Languages:
Top Skills: Golang, Swift

5. Specialized Data Management and Workflow Tools:
Top Skills: Couchbase, Atlassian, Twilio

6. High Demand for Data Orchestration and Automation:
Top Skills: Airflow, Jenkins

7. Open Source Tools and Frameworks:
Top Skills: Jupyter, Pandas, Numpy, Scikit-learn, Golang, Linux



[
  {
    "skills": "pyspark",
    "avg_salary_per_skill": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary_per_skill": "189155"
  },
  {
    "skills": "watson",
    "avg_salary_per_skill": "160515"
  },
  {
    "skills": "couchbase",
    "avg_salary_per_skill": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary_per_skill": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary_per_skill": "154500"
  },
  {
    "skills": "swift",
    "avg_salary_per_skill": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary_per_skill": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary_per_skill": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary_per_skill": "145000"
  },
  {
    "skills": "golang",
    "avg_salary_per_skill": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary_per_skill": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary_per_skill": "141907"
  },
  {
    "skills": "linux",
    "avg_salary_per_skill": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary_per_skill": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary_per_skill": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary_per_skill": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary_per_skill": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary_per_skill": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary_per_skill": "125436"
  }
]
*/
