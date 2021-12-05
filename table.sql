SELECT first_name, hire_date
FROM employees
WHERE department_id IN (SELECT department_id
    FROM employees
    WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

SELECT department_id, count(department_id) 
FROM employees
GROUP BY department_id
HAVING count(department_id) = (SELECT MAX(count(department_id))
	FROM employees
	GROUP BY department_id);
	
SELECT department_id, first_name
FROM employees
WHERE department_id = (SELECT department_id
	FROM employees
	WHERE first_name='Daniel')
AND salary < (SELECT salary
	FROM employees
	WHERE first_name = 'Jack');
	
SELECT first_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id
	FROM departments
	WHERE department_name = 'Shipping')
	AND TO_CHAR(hire_date,'yyyy') = '2007';
	
SELECT first_name, department_name, city
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id)
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT employee_id, salary
FROM employees
WHERE salary = (SELECT salary
	FROM employees
	WHERE first_name = 'Allan')
AND first_name<> 'Allan';

SELECT first_name, hire_date
FROM employees
WHERE hire_date > ALL(SELECT hire_date
	FROM employees
	WHERE department_id = 100)
AND department_id<> 100;

SELECT department_id, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, round(avg(salary))
	FROM employees
	GROUP BY department_id);
	
SELECT department_id, first_name, salary
FROM employees A
WHERE 2 > (SELECT COUNT(*)
	from employees
	WHERE salary > A.salary
	AND department_id = A.department_id)
ORDER BY department_id, salary DESC;

SELECT first_name, job_id, salary
FROM employees
WHERE(job_id = 'FI_ACCOUNT' OR job_id = 'SA_REP')
AND salary > (SELECT MAX(salary)
	FROM employees
	WHERE job_id = 'IT_PROG')
	ORDER BY 3 DESC;