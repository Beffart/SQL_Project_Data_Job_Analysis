/* Questions to Answer

1. What are the top paying jobs for my role? Done!
2. What are the skills required for these top-payinng roles? 
3. What are the most in-demand skills for my role? Done!
4. What are the top skills based on salary for my role? Next!
5. What are the most optimal skills to learn?
    a. Optimal: High Demand AND High Paying

Question: What are the top skills based on salary for Data Analysts?
 - Look for the average salary associated with each skill for Data Analysts positions.
 - Focuses on roles with specified salaries, regardless of location.
 - Why? It reveals how diferent skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
limit 25

/*
Here are some key insights from the top 25 highest-paying skills for data analysts:

1. Big Data & Cloud Technologies Dominate
PySpark ($208K) and Databricks ($141K) are highly paid, emphasizing the demand for distributed computing and big data processing.
GCP ($122K) and Kubernetes ($132K) indicate strong demand for cloud computing and containerization skills.
2. DevOps & Version Control are Valuable
Bitbucket ($189K), GitLab ($154K), and Jenkins ($125K) highlight the importance of version control and CI/CD in data workflows.
3. AI & Machine Learning Boost Salaries
DataRobot ($155K) and Scikit-learn ($125K) suggest a premium on ML-related skills.
Watson ($160K) implies demand for AI-related tools.
4. Programming Beyond Python is Rewarded
Swift ($153K) and Golang ($145K) show that non-traditional data analysis languages can still command high salaries.
Scala ($124K) is widely used in data engineering and big data processing.
5. SQL Variants & NoSQL Databases Pay Well
Couchbase ($160K) and PostgreSQL ($123K) highlight the importance of database expertise.
Elasticsearch ($145K) is relevant for large-scale search and analytics.
6. Data Engineering & Workflow Automation Matter
Apache Airflow ($126K) is crucial for data pipeline automation.
Jupyter ($152K) and Pandas ($151K) show that traditional data manipulation tools are still valuable.
*/

