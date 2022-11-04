USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT AUTO_INCREMENT,
    artist VARCHAR(255),
    `name` VARCHAR(255),
    release_date INT,
    sales FLOAT,
    genre VARCHAR(255),
    PRIMARY KEY (id)
);