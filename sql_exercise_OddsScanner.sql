-- 1 exercise
-- I get the names and departmentId and created
-- the condition to show just when dept_id=30 or 100
SELECT FIRST_NAME,
    LAST_NAME,
    DEPARTMENT_ID
FROM employees
WHERE (
        DEPARTMENT_ID = 30
        OR DEPARTMENT_ID = 100
    )
ORDER BY DEPARTMENT_ID ASC;
-- 2 exercise
-- I get the min salary of employees and
-- group by the manager id 
SELECT manager_id,
    MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY MIN(salary) DESC;
-- 3 exercise
-- find the row where last name = bell and 
-- look for the salary greater than the this row
SELECT FIRST_NAME,
    LAST_NAME,
    SALARY
FROM employees
WHERE SALARY > (
        SELECT SALARY
        FROM employees
        WHERE LAST_NAME = 'Bell'
    );
-- 4 exercise
-- in this exercise I used 3 tables and find
-- the connections between them to find when the
-- location = london
SELECT emp.FIRST_NAME,
    emp.LAST_NAME,
    emp.JOB_ID,
    emp.DEPARTMENT_ID,
    dep.DEPARTMENT_NAME
FROM employees emp
    JOIN departments dep ON (emp.DEPARTMENT_ID = dep.DEPARTMENT_ID)
    JOIN locations loc ON (dep.LOCATION_ID = loc.LOCATION_ID)
WHERE LOWER(loc.city) = 'London';
-- 5 exercise 
-- count the number of the department that 
-- appear, so you can find how much employees
-- are at this department
-- and show group by department name
SELECT DEPARTMENT_NAME,
    COUNT(DEPARTMENT_NAME) AS NUMBER_EMPLOYEES
FROM employees emp
    JOIN departments dep ON (dep.DEPARTMENT_ID = emp.DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME
ORDER BY NUMBER_EMPLOYEES ASC;