--Total number of employees
SELECT COUNT(Employee_ID) AS 'Total Employees'
FROM Employee_performance



--List of dictinct departments
SELECT DISTINCT DEPARTMENT
FROM Employee_performance



--Average performance score per department
SELECT DEPARTMENT, AVG(PERFORMANCE_SCORE) AS 'Performance Score'
FROM Employee_performance
GROUP BY Department



--Average monthly salary by department
SELECT DEPARTMENT, ROUND(AVG(MONTHLY_SALARY),2) AS 'Average Salary'
FROM Employee_performance
GROUP BY Department



--Employee count by gender
SELECT GENDER, COUNT(EMPLOYEE_ID) AS 'Total Employee'
FROM Employee_performance
GROUP BY GENDER



--Employees who resigned
SELECT COUNT(EMPLOYEE_ID) AS 'Resigned Employees'
FROM Employee_performance
WHERE Resigned = 'True'



--Average age by job title
SELECT JOB_TITLE, AVG(AGE) AS AGE
FROM Employee_performance
GROUP BY Job_Title



--Average satisfaction level of employees by department
SELECT DEPARTMENT, ROUND(AVG(Employee_Satisfaction_Score),2) AS 'Satisfaction_score'
FROM Employee_performance
GROUP BY Department
ORDER BY 2 DESC



--Employees who has peformance score above company average
SELECT EMPLOYEE_ID FROM Employee_performance
WHERE Performance_Score>(
SELECT AVG(PERFORMANCE_SCORE) FROM Employee_performance)



--Count Employee by education level
SELECT EDUCATION_LEVEL, COUNT(EMPLOYEE_ID) AS 'Total Employees'
FROM Employee_performance
GROUP BY Education_Level



--Average years at company per department
SELECT DEPARTMENT, AVG(YEARS_AT_COMPANY) AS 'Avg_of_Years_at_company'
FROM Employee_performance
GROUP BY Department



--Employees who have never been promoted
SELECT COUNT(EMPLOYEE_ID) AS 'Employees who have not promoted'
FROM Employee_performance
WHERE Promotions = 0



--Average training hour per department
SELECT DEPARTMENT, AVG(TRAINING_HOURS) 'Average Training Hours'
FROM Employee_performance
GROUP BY Department



--Employees whos working more than 55 hours per week
SELECT EMPLOYEE_ID 
FROM Employee_performance
WHERE Work_Hours_Per_Week >55



--Job titles who are earning more than the average
SELECT JOB_TITLE, ROUND(AVG(MONTHLY_SALARY),2) AS 'Average Salary' 
FROM Employee_performance
GROUP BY Job_Title
HAVING AVG(Monthly_Salary)>(SELECT AVG(MONTHLY_SALARY) FROM Employee_performance)



--Employee who resigned within first 2 years of joining
SELECT EMPLOYEE_ID, YEARS_AT_COMPANY, RESIGNED
FROM Employee_performance
WHERE Years_At_Company<=2
AND Resigned = 'True'



--Average overtime hours per job title
SELECT JOB_TITLE,AVG(OVERTIME_HOURS) AS 'Average overtime hours'
FROM Employee_performance
GROUP BY Job_Title



--Employees whos handling more projects than the average
SELECT EMPLOYEE_ID FROM EMPLOYEE_PERFORMANCE WHERE Projects_Handled>
(SELECT AVG(Projects_Handled) AS 'Average projects'
FROM Employee_performance)



--Average sick dats per department
SELECT DEPARTMENT, AVG(SICK_DAYS) AS 'Sick Days'
FROM Employee_performance GROUP BY Department



--Departments with highest resignation rate
SELECT DEPARTMENT, COUNT(RESIGNED) AS 'Rsignation Rate'
FROM Employee_performance
WHERE RESIGNED= 'True'
GROUP BY Department
ORDER BY 2 DESC



--Employee with zero training hour but high performance
SELECT  EMPLOYEE_ID ,TRAINING_HOURS,PERFORMANCE_SCORE
FROM Employee_performance
WHERE Training_Hours=0
AND Performance_Score=5



--Average satisfaction level between remote vs non remote work
SELECT REMOTE_WORK_FREQUENCY, ROUND(AVG(EMPLOYEE_SATISFACTION_SCORE),2) AS 'Average Satisfaction Score'
FROM Employee_performance
GROUP BY Remote_Work_Frequency
ORDER BY 2 DESC



--Employee with overdue promotion (years at company>3 and promotions =0)
SELECT EMPLOYEE_ID,YEARS_AT_COMPANY,PROMOTIONS
FROM Employee_performance
WHERE Years_At_Company > 3
AND Promotions = 0



--Average age per department
SELECT DEPARTMENT, AVG(AGE) AS AGE
FROM Employee_performance
GROUP BY Department



--CTE to calculate department KPIs
WITH CTE AS 
(
SELECT DEPARTMENT, 
AVG(PERFORMANCE_SCORE) AS 'Average Performance Score',
ROUND(AVG(MONTHLY_SALARY),2) AS 'Average Monthly Salary'
FROM Employee_performance
GROUP BY Department
)
SELECT * FROM CTE



--Employees whos performance is below than the company average
SELECT EMPLOYEE_ID FROM Employee_performance WHERE PERFORMANCE_SCORE <
(SELECT AVG(PERFORMANCE_SCORE) AS AVG_SCORE FROM Employee_performance)



--High potential employees ( High Performance + High Training + Low years at company )
SELECT EMPLOYEE_ID, PERFORMANCE_SCORE,TRAINING_HOURS, YEARS_AT_COMPANY 
FROM Employee_performance
WHERE Performance_Score = 5
AND Training_Hours > 90 
AND Years_At_Company =1



--- #CREATING VIEW(IT PROVIDES SECURITY)--
CREATE VIEW SCORE AS (
SELECT DEPARTMENT, ROUND(AVG(EMPLOYEE_SATISFACTION_SCORE),2) AS 'Satisfaction Score'
FROM Employee_performance
GROUP BY Department)
--
SELECT * FROM SCORE
--














