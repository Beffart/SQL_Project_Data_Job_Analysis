/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM 'C:/Users/guilh/OneDrive/Workplace/SQL/SQL_Project_Data_Job_Analysis/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:/Users/guilh/OneDrive/Workplace/SQL/SQL_Project_Data_Job_Analysis/csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:/Users/guilh/OneDrive/Workplace/SQL/SQL_Project_Data_Job_Analysis/csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'C:/Users/guilh/OneDrive/Workplace/SQL/SQL_Project_Data_Job_Analysis/csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding

COPY company_dim
FROM 'C:\Users\guilh\OneDrive\Workplace\SQL\SQL_Project_Data_Job_Analysis\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\guilh\OneDrive\Workplace\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\guilh\OneDrive\Workplace\SQL\SQL_Project_Data_Job_Analysis\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\guilh\OneDrive\Workplace\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT *
FROM company_dim
LIMIT 100

SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
LIMIT 5;


SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;
-- LIMIT 5;



SELECT
    AVG(salary_year_avg) AS avg_salary_year,
    AVG(salary_hour_avg) AS avg_salary_hour
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'


    CREATE TABLE january_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 1;

    CREATE TABLE february_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 2;

    CREATE TABLE march_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 3;

    CREATE TABLE april_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 4;

    CREATE TABLE may_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 5;

    CREATE TABLE june_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 6;

    CREATE TABLE july_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 7;

    CREATE TABLE august_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 8;

    CREATE TABLE september_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 9;

    CREATE TABLE october_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 10;

    CREATE TABLE november_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 11;

    CREATE TABLE december_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 12;


SELECT job_posted_date
FROM march_jobs

SELECT
    COUNT(job_id) AS number_of_jobs,
    -- job_title_short,
    -- job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
    FROM
         job_postings_fact
    WHERE
        job_title_short = 'Data Analyst'
    GROUP BY
         location_category;


SELECT
    company_id,
    name AS company_name
FROM
    company_dim

WHERE company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE
    ORDER BY
        company_id
)



WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    name AS company_name,
    company_job_count.total_jobs
FROM
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC 




SELECT
    company_id,
    COUNT(*)
FROM
    job_postings_fact
GROUP BY
    company_id


