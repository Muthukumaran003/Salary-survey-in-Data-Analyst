CREATE DATABASE SALARY_DATA;
USE SALARY_DATA;
SELECT * FROM SALARY_SURVEY;

-- 1. Average Salary by Industry and Gender 
SELECT INDUSTRY,GENDER, ROUND(AVG(TOTAL_SALARY),2) AS AVG_SALARY FROM SALARY_SURVEY
GROUP BY INDUSTRY,GENDER 
ORDER BY AVG_SALARY DESC;

-- 2.Total Salary Compensation by Job Title
SELECT JOB_TITLE, SUM(Annual_Salary + Additional_Monetary_Compensation) AS TOTAL_SALARY 
FROM SALARY_SURVEY
GROUP BY JOB_TITLE 
ORDER BY TOTAL_SALARY DESC;

/*3. Salary Distribution by Education Level 
o Find the salary distribution (average salary, minimum, and maximum) for 
different education levels. This helps analyze the correlation between education 
and salary. */

SELECT Highest_Level_of_Education_Completed, ROUND(AVG(TOTAL_SALARY),2) AS AVG_SALRAY,
MAX(TOTAL_SALARY)AS MAX_SALARY,MIN(TOTAL_SALARY) AS MIN_SALARY 
FROM SALARY_SURVEY
GROUP BY Highest_Level_of_Education_Completed
ORDER BY AVG_SALRAY DESC;

-- 4.Number of Employees by Industry and Years of Experience 
SELECT INDUSTRY,Years_of_Professional_Experience_in_Field, COUNT(NAME) AS NUMBER_EMPLOYEES 
FROM SALARY_SURVEY
GROUP BY INDUSTRY,Years_of_Professional_Experience_in_Field
ORDER BY NUMBER_EMPLOYEES DESC;

/* 5. Median Salary by Age Range and Gender 
Calculate the median salary within different age ranges and genders. This can 
provide insights into salary trends across different age groups and gender. */

select Gender,Age_Range,round(avg(salary_usd),2) as median
from salary_survey
group by Gender,Age_Range;

-- 6.Job Titles with the Highest Salary in Each Country 
SELECT JOB_TITLE,COUNTRY,MAX(TOTAL_SALARY) AS HIGHEST_SALARY 
FROM SALARY_SURVEY
GROUP BY JOB_TITLE,COUNTRY 
ORDER BY HIGHEST_SALARY DESC;

-- 7.Average Salary by City and Industry 

SELECT CITY,INDUSTRY, ROUND(AVG(TOTAL_SALARY),2) AS AVG_SALARY 
FROM SALARY_SURVEY
GROUP BY CITY,INDUSTRY 
ORDER BY AVG_SALARY DESC;

-- 8.Percentage of Employees with Additional Monetary Compensation by Gender
SELECT GENDER, ROUND(COUNT(CASE WHEN Additional_Monetary_Compensation > 0 THEN 1 END) * 100.0 / COUNT(*),2)
AS 'EMPLOYEES(%)'
FROM SALARY_SURVEY
GROUP BY GENDER
ORDER BY 'EMPLOYEES(%)';

-- 9.Total Compensation by Job Title and Years of Experience 
SELECT JOB_TITLE,Years_of_Professional_Experience_in_Field, SUM(ANNUAL_SALARY + Additional_Monetary_Compensation) AS TOTAL_COMPENSATION
FROM SALARY_SURVEY
GROUP BY JOB_TITLE,Years_of_Professional_Experience_in_Field
ORDER BY TOTAL_COMPENSATION DESC;

-- 10.Average Salary by Industry, Gender, and Education Level 
SELECT INDUSTRY,GENDER,Highest_Level_of_Education_Completed, ROUND(AVG(TOTAL_SALARY),2) AS AVG_SALARY
FROM SALARY_SURVEY
GROUP BY INDUSTRY,GENDER,Highest_Level_of_Education_Completed
ORDER BY AVG_SALARY DESC;

