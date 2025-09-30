
CREATE DATABASE company_tasks_db;

USE company_tasks_db;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);


INSERT INTO employees (emp_id, name, department, salary, manager_id) VALUES
(1, 'John', 'HR', 40000, NULL),
(2, 'Priya', 'IT', 60000, 1),
(3, 'Amit', 'IT', 55000, 2),
(4, 'Sara', 'Finance', 70000, 1),
(5, 'Ramesh', 'HR', 45000, 1),
(6, 'Kavya', 'Finance', 65000, 4),
(7, 'Anil', 'IT', 50000, 2),
(8, 'Meena', 'Finance', 72000, 4);

--Subquery in SELECT
SELECT 
    name,
    salary,
    (SELECT AVG(salary) FROM employees) AS overall_avg_salary
FROM employees;

--Subquery in WHERE
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--Subquery with IN
SELECT name, department, salary
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 65000
);

--Subquery with EXISTS
SELECT e.name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees sub
    WHERE sub.manager_id = e.emp_id
);

--Correlated Subquery
SELECT name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees sub
    WHERE sub.department = e.department
);

--Subquery in FROM (Derived Table)
SELECT department, max_salary
FROM (
    SELECT department, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department
) AS dept_summary;



