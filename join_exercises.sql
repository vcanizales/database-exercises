USE join_test_db;

SHOW TABLES;

SELECT * FROM roles;
SELECT * FROM users;

SELECT users.name as user_name, roles.name as role_name
FROM users
         JOIN roles ON users.role_id = roles.id;
#
# SELECT users.name AS user_name, roles.name AS role_name
# FROM users
#          LEFT JOIN roles ON users.role_id = roles.id;
#
#
# #THESE 2 ARE THE SAME FOR RIGHT JOIN, THE SECOND IS REWRITTEN
# SELECT users.name AS user_name, roles.name AS role_name
# FROM users
#          RIGHT JOIN roles ON users.role_id = roles.id;
#
# SELECT users.name as user_name, roles.name as role_name
# FROM roles
#          LEFT JOIN users ON users.role_id = roles.id;