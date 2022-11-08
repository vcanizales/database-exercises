USE employees;

SELECT CONCAT(first_name,'', last_name) AS name FROM employees WHERE first_name = 'Maya' ORDER BY last_name;
SELECT CONCAT('Hello ', 'Codeup', '!');
SELECT DAYOFMONTH(hire_date) FROM employees WHERE first_name = 'Maya';
SELECT DAY('2017-03-25');
SELECT MONTH('2008-02-03');
SELECT YEAR('1987-01-01');
SELECT CURRENT_TIMESTAMP;
SELECT NOW();

SELECT DATEDIFF(NOW(), hire_date) FROM employees WHERE emp_no = 10006;