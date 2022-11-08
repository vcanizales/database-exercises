USE employees;

SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;

SELECT salary FROM salaries ORDER BY salary DESC LIMIT 5;

SELECT emp_no, salary FROM salaries ORDER BY salary LIMIT 5 OFFSET 45;






# SELECT * FROM employees WHERE birth_date LIKE '1954-01%' ORDER BY birth_date, last_name LIMIT 50;
#
# SELECT * FROM employees WHERE birth_date LIKE '1954-01%' ORDER BY birth_date, last_name LIMIT 50 OFFSET 50;
