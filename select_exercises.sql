USE codeup_test_db;

SELECT * FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date FROM albums WHERE name = 'Sgt. Peppers Lonely hearts Club Band';
SELECT genre FROM albums WHERE name = 'Thriller';
SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 2000;