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