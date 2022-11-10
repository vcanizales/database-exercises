USE employees;

SELECT CONCAT(last_name,' ',first_name) AS full_name FROM employees LIMIT 10;

SELECT CONCAT(last_name,' ',first_name) AS `FULL NAME`, birth_date AS `DOB` FROM employees LIMIT 10;

SELECT CONCAT(emp_no,' ',last_name,', ',first_name) AS `FULL NAME`, birth_date AS `DOB` FROM employees LIMIT 10;

SHOW INDEXES FROM salaries;

SHOW INDEXES FROM employees;

SELECT salary FROM salaries WHERE salary BETWEEN 50000 AND 70000;

ALTER TABLE salaries ADD INDEX salary_index (salary);

ALTER TABLE salaries DROP INDEX salary_index;

DESCRIBE salaries;

#ALTER TABLE t.name ADD UNIQUE (c.name...);
#Whatever column you name in there cannot be repeated





