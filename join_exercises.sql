USE join_test_db;

SHOW TABLES;

SELECT * FROM roles;
SELECT * FROM users;

SELECT users.name as user_name, roles.name as role_name
FROM users
         JOIN roles ON users.role_id = roles.id;

SELECT COUNT(*), roles.name as r
FROM roles
        LEFT JOIN users ON users.role_id = roles.id
        GROUP BY roles.name;

USE employees;

SHOW TABLES;
SELECT * FROM departments;
SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT dept_name AS `Department Name`, CONCAT(first_name,' ',last_name) AS `Department Manager` FROM employees
    JOIN dept_manager dm on employees.emp_no = dm.emp_no
    JOIN departments d ON dm.dept_no = d.dept_no
    WHERE dm.to_date > CURDATE() ORDER BY dept_name;

# Find the name of all departments currently managed by women
SELECT e.first_name, e.last_name FROM employees e
    JOIN dept_manager dm on e.emp_no = dm.emp_no
    JOIN departments d on dm.dept_no = d.dept_no
    WHERE dm.to_date> CURDATE()
    AND gender = 'f';


# Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS `Title`, COUNT(*) AS `Total` FROM titles as t
    JOIN dept_emp de on t.emp_no = de.emp_no
    JOIN departments d on de.dept_no = d.dept_no
    WHERE de.to_date > CURDATE()
    AND t.to_date > CURDATE()
    AND d.dept_name = 'Customer Service' GROUP BY t.title;


# Find the current salary of all current managers.
SELECT dept_name AS `Department Name`, CONCAT(first_name, last_name) AS `Department Manager`, salary AS `Salary` FROM employees
    JOIN dept_manager dm ON employees.emp_no = dm.emp_no
    JOIN departments d ON dm.dept_no = d.dept_no
    JOIN salaries s on employees.emp_no = s.emp_no
    WHERE dm.to_date > CURDATE()
    AND s.to_date > CURDATE()
    ORDER BY dept_name;


# Bonus Find the names of all current employees, their department name, and their current manager's name .

SELECT CONCAT(first_name, ' ',last_name) AS `Employee`, d.dept_name AS `Department`, CONCAT(first_name,' ',last_name) AS `Department Manager` FROM employees
    JOIN dept_emp emp ON emp.emp_no = emp.emp_no
    JOIN departments d ON emp.dept_no = d.dept_no
    JOIN dept_manager dm ON employees.emp_no = dm.emp_no
    WHERE emp.to_date = '9999-01-01' AND dm.to_date = '9999-01-01';