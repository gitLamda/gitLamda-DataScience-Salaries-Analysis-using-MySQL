SELECT * FROM dsinfo.ds_salaries LIMIT 10;
-- Average salary by Experience Level
SELECT experience_level,AVG(salary_in_usd) AS avg_salary FROM dsinfo.ds_salaries GROUP BY experience_level ORDER BY avg_salary;

-- Highest Salary
SELECT MAX(salary_in_usd) AS max_salary FROM dsinfo.ds_salaries;

-- Filtering Data
-- Salaries abouve a certain threshhold
SELECT * FROM dsinfo.ds_salaries WHERE salary_in_usd>80000 ORDER BY salary_in_usd DESC;
-- Salaries for Senior Data Scientists
SELECT * FROM dsinfo.ds_salaries WHERE experience_level="SE";

-- Sorting Data
-- Top 10 Highest paying job titles
SELECT job_title,AVG(salary_in_usd) AS avg_salary FROM dsinfo.ds_salaries GROUP BY job_title ORDER BY avg_salary DESC LIMIT 10;

-- Total Salary Expenses by Company Size
SELECT company_size,SUM(salary_in_usd) AS Total_Salary_Expenses FROM dsinfo.ds_salaries GROUP BY company_size ORDER BY Total_Salary_Expenses DESC;

-- Average Remote Ratio
SELECT AVG(remote_ratio) FROM dsinfo.ds_salaries ; 

-- Compare Employee and Company Locations
SELECT employee_residence,company_location,count(*) AS num_of_employees FROM dsinfo.ds_salaries GROUP BY employee_residence,company_location;

-- Convert Salary to Another Currency
SELECT job_title,salary_in_usd ,CASE WHEN salary_currency="EUR" THEN salary_in_usd*0.92 WHEN salary_currency="GBP" THEN salary_in_usd*0.79 ELSE salary_in_usd END AS CovertedSalary FROM dsinfo.ds_salaries;

-- Count Null Values
SELECT count(*) AS num_rows, SUM(CASE WHEN salary IS NULL THEN 1 ELSE 0 END) AS null_salary,SUM(CASE WHEN experience_level IS NULL THEN 1 ELSE 0 END) AS null_experience FROM dsinfo.ds_salaries;

CREATE TABLE Employee (employee_id INT PRIMARY KEY,work_year INT,experience_level VARCHAR(50),employment_type VARCHAR(50),job_title VARCHAR(255),salary DECIMAL(10, 2),salary_currency VARCHAR(10),salary_in_usd DECIMAL(10, 2),employee_residence VARCHAR(255),remote_ratio DECIMAL(4, 2),company_id INT);
CREATE TABLE Company (company_id INT PRIMARY KEY,company_location VARCHAR(255),company_size VARCHAR(50));