USE codeup_test_db;

CREATE TABLE `quotes` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `content` varchar(240) NOT NULL,
                          `author` varchar(50) NOT NULL,
                          PRIMARY KEY (`id`)
);

INSERT INTO quotes (content, author) VALUES
                                         ('The real voyage of discovery consists not in seeking new landscapes, but in having new eyes.', 'Marcel Proust'),
                                         ('My destination is no longer a place, rather a new way of seeing.', 'Marcel Proust'),
                                         ('Reading is that fruitful miracle of a communication in the midst of solitude.', 'Marcel Proust'),
                                         ('Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.', 'Neil Gaiman'),
                                         ('I hope that in this year to come, you make mistakes. Because if you are making mistakes...you''re Doing Something.', 'Neil Gaiman'),
                                         ('I hope you will have a wonderful year, that you''ll dream dangerously and outrageously, that you''ll make something that didn''t exist before you made it', 'Neil Gaiman');

CREATE TABLE authors (
                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                         author_name VARCHAR(50) NOT NULL,
                         PRIMARY KEY (id)
);

ALTER TABLE quotes DROP author;

ALTER TABLE quotes ADD author_id INT UNSIGNED NOT NULL;

# ALTER TABLE quotes ADD CONSTRAINT quotes_author_id_fk FOREIGN KEY (author_id) REFERENCES authors(id);

SHOW INDEXES FROM quotes;

INSERT INTO authors (author_name) VALUES
                                      ('Marcel Proust'),
                                      ('Neil Gaiman');

TRUNCATE quotes;

SET @neil_gaiman_id := (SELECT id FROM authors WHERE author_name = 'Neil Gaiman');
SET @marcel_proust_id := (SELECT id FROM authors WHERE author_name = 'Marcel Proust');

INSERT INTO quotes (content, author_id) VALUES
                                            ('The real voyage of discovery consists not in seeking new landscapes, but in having new eyes.', @marcel_proust_id),
                                            ('My destination is no longer a place, rather a new way of seeing.', @marcel_proust_id),
                                            ('Reading is that fruitful miracle of a communication in the midst of solitude.', @marcel_proust_id),
                                            ('Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.', @neil_gaiman_id),
                                            ('I hope that in this year to come, you make mistakes. Because if you are making mistakes...you''re Doing Something.', @neil_gaiman_id),
                                            ('I hope you will have a wonderful year, that you''ll dream dangerously and outrageously, that you''ll make something that didn''t exist before you made it', @neil_gaiman_id);

ALTER TABLE quotes ADD CONSTRAINT quotes_author_id_fk FOREIGN KEY (author_id) REFERENCES authors (id);

DESCRIBE quotes;

SELECT author_name AS author, content AS quote FROM authors a JOIN quotes q on a.id = q.author_id;

CREATE TABLE topics (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        topic VARCHAR(50),
                        PRIMARY KEY (id)
);

INSERT INTO topics (topic) VALUES
                               ('literature'),
                               ('philosophy'),
                               ('inspiration'),
                               ('hope');

CREATE TABLE quote_topics (
                              quote_id INT NOT NULL,
                              topic_id INT UNSIGNED NOT NULL,
                              CONSTRAINT quote_topics_quote_id_fk FOREIGN KEY (quote_id) REFERENCES quotes (id),
                              CONSTRAINT quote_topics_topic_id_fk FOREIGN KEY (topic_id) REFERENCES topics (id)
);

INSERT INTO quote_topics  (quote_id, topic_id) VALUES
                                                   (1, 2),
                                                   (1, 3),
                                                   (2, 2),
                                                   (2, 3),
                                                   (3, 1),
                                                   (3, 2),
                                                   (4, 1),
                                                   (4, 3),
                                                   (5, 3),
                                                   (5, 4),
                                                   (6, 3),
                                                   (6, 4);

SET @literature_id := (SELECT id FROM topics WHERE topic = 'Literature');

SELECT content, author_name AS author FROM authors a JOIN quotes q on a.id = q.author_id JOIN quote_topics qt on q.id = qt.quote_id WHERE qt.quote_id = @literature_id;

