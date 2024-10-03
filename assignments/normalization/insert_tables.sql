-- Insert values into books
INSERT INTO books (title, isbn, year_pub) VALUES ('Catch-22', '978-1-4516-2665-0', 1961);
INSERT INTO books (title, isbn, year_pub) VALUES ('The Martian', '978-0-553-41802-6', 2011);
INSERT INTO books (title, isbn, year_pub) VALUES ('Grit', '978-1-5011-1110-5', 2016);
INSERT INTO books (title, isbn, year_pub) VALUES ('Jupiters Circle', '978-1-63215-707-2', 2016);

-- Insert values into countries
INSERT INTO countries (country_name) VALUES ('US');
INSERT INTO countries (country_name) VALUES ('CAN');
INSERT INTO countries (country_name) VALUES ('UK');
INSERT INTO countries (country_name) VALUES ('AUS');

-- Insert values into publishers
INSERT INTO publishers (pubName) VALUES ('Schuster');
INSERT INTO publishers (pubName) VALUES ('Broadway Books');
INSERT INTO publishers (pubName) VALUES ('Image Comics');

-- Insert values into authors
INSERT INTO authors (authorName) VALUES ('Andy Weir');
INSERT INTO authors (authorName) VALUES ('Joseph Heller');
INSERT INTO authors (authorName) VALUES ('Mark Millar');
INSERT INTO authors (authorName) VALUES ('Angela Duckworth');

-- Insert values into books_author
INSERT INTO books_author (book_id, author_id) VALUES (1, 2);
INSERT INTO books_author (book_id, author_id) VALUES (2, 1);
INSERT INTO books_author (book_id, author_id) VALUES (3, 4);
INSERT INTO books_author (book_id, author_id) VALUES (4, 3);

-- Insert values into book_publisher
INSERT INTO book_publisher (book_id, pub_id) VALUES (1, 1);
INSERT INTO book_publisher (book_id, pub_id) VALUES (2, 2);
INSERT INTO book_publisher (book_id, pub_id) VALUES (3, 1);
INSERT INTO book_publisher (book_id, pub_id) VALUES (4, 3);

-- Insert values into publisher_country
INSERT INTO publisher_country (pub_id, country_id) VALUES (1, 1);
INSERT INTO publisher_country (pub_id, country_id) VALUES (2, 1);
INSERT INTO publisher_country (pub_id, country_id) VALUES (3, 1);

