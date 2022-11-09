USE employees;

SELECT COUNT(first_name), gender FROM employees GROUP BY gender;
#This will not work
SELECT first_name FROM employees GROUP BY gender;

SELECT AVG(DATEDIFF(hire_date, birth_date))/365 FROM employees;

#Youngest employee hired
SELECT MIN(DATEDIFF(hire_date, birth_date))/365 FROM employees;

#Oldest employee hired
SELECT MAX(DATEDIFF(hire_date, birth_date))/365 FROM employees;


#Identitical outcomes for the next 2 commands
SELECT first_name FROM employees GROUP BY first_name;
SELECT DISTINCT first_name FROM employees GROUP BY first_name;

SELECT COUNT(first_name), first_name FROM employees GROUP BY first_name;

SELECT COUNT(first_name), first_name FROM employees GROUP BY first_name ORDER BY COUNT(first_name) DESC;


