USE employees;

SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' and last_name LIKE '%E' GROUP BY last_name;

SELECT DISTINCT first_name, last_name FROM employees WHERE last_name LIKE 'E%' and last_name LIKE '%E' GROUP BY first_name, last_name;

SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q' LIKE 'q%' LIKE '%q%' NOT LIKE '%qu' NOT LIKE 'qu%' NOT LIKE '%qu%'GROUP BY last_name;