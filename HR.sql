select first_name, department_name, salary
FROM employees
JOIN departments USING (department_id)
WHERE salary > = 10000;

SELECT department_name,  city
FROM departments
JOIN locations USING (location_id);

SELECT city department_name
FROM departments
JOIN locations USING (location_id)
WHERE city IN ('Toronto','Munich');

SELECT department_name, first_name 
FROM employees A
JOIN departments B
WHERE A.employee_id = B.manager_id;

SELECT A.first_name, A.salary, B.first_name, B.salary
FROM employees A
JOIN employees B ON A.manager_id = B.employee_id
AND A.salary > B.salary;

SELECT A.employee_id, B.employee_id, A.first_name, B.first_name
FROM employees A
JOIN employees B ON A.first_name = B.first_name
AND a.employee_id <> B.employee_id;