USE employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

SELECT birth_date FROM employees
    WHERE emp_no IN (SELECT emp_no FROM dept_manager);

INSERT INTO users (name, email, role_id)
VALUES('fer', 'fer@codeup.com',
       (SELECT id FROM roles WHERE name = 'commenter')
      );

UPDATE users
SET role_id = (SELECT id FROM roles WHERE name = 'admin')
WHERE email = 'fer@codeup.com';

SELECT * FROM employees WHERE hire_date = (SELECT hire_date FROM employees WHERE emp_no = '101010');

SELECT * FROM titles WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name = 'Aamod');

SELECT first_name, last_name FROM employees WHERE emp_no IN (
    SELECT emp_no FROM dept_manager WHERE emp_no IN (
        SELECT emp_no FROM employees WHERE gender = 'f'
        )
    AND to_date > CURDATE()
    );

##############BONUS#################

SELECT dept_name FROM departments WHERE dept_no IN (
    SELECT dept_no FROM dept_manager WHERE emp_no IN (
        SELECT emp_no FROM employees WHERE gender = 'F'
        )
    AND to_date > CURDATE()
    );

SELECT first_name, last_name FROM employees WHERE emp_no IN (
    SELECT emp_no FROM salaries WHERE salary IN (
        SELECT max(salary) FROM salaries
        ));