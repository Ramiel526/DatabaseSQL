## create tables

```SQL
-- Drop tables

drop table books;
drop table authors;
drop table publishers;
drop table countries;
drop table book_author;
drop table book_publisher;
drop table publisher_country;

drop sequence book_seq, author_seq, pub_seq, country_seq;

-- create sequences
create sequence book_seq start with 1;
create sequence author_seq start with 1;
create sequence pub_seq start with 1;
create sequence country_seq start with 1;

-- create tables
create table books (
	book_id int primary key,
	title varchar2(100),
	isbn varchar2(30),
	year_pub int
);

create table authors (
	author_id int primary key,
	authorName varchar2(100)
);

create table books_author (
	book_id int,
	author_id int,
	foreign key (book_id) references book(book_id),
	foreign key (author_id) references authors(author_id)
);

create table publishers (
	pub_id int primary key,
	pubName varchar2(100)
);

create table countries (
	country_id int primary key,
	country_name varchar2(100)
);

create table book_publisher (
	pub_id int references publishers(pub_id),
	book_id int references books(book_id)
);

create table publisher_country (
	pub_id int references publishers(pub_id),
	country_id int references countries(country_id)
);
```

## insert tables

```SQL
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

-- Check data in books
SELECT * FROM books;

-- Check data in authors
SELECT * FROM authors;

-- Check data in books_author
SELECT * FROM books_author;

-- Check data in publishers
SELECT * FROM publishers;

-- Check data in book_publisher
SELECT * FROM book_publisher;

-- Check data in countries
SELECT * FROM countries;

-- Check data in publisher_country
SELECT * FROM publisher_country;
```

### Books Table

| BOOK\_ID | TITLE | ISBN | YEAR\_PUB |
| --- | --- | --- | --- |
| 1 | Catch-22 | 978-1-4516-2665-0 | 1961 |
| 2 | The Martian | 978-0-553-41802-6 | 2011 |
| 3 | Grit | 978-1-5011-1110-5 | 2016 |
| 4 | Jupiters Circle | 978-1-63215-707-2 | 2016 |

### Authors Table

| AUTHOR\_ID | AUTHORNAME |
| --- | --- |
| 1 | Andy Weir |
| 2 | Joseph Heller |
| 3 | Mark Millar |
| 4 | Angela Duckworth |

### Books\_Author Table

| BOOK\_ID | AUTHOR\_ID |
| --- | --- |
| 1 | 2 |
| 2 | 1 |
| 3 | 4 |
| 4 | 3 |

### Publishers Table

| PUB\_ID | PUBNAME |
| --- | --- |
| 1 | Schuster |
| 2 | Broadway Books |
| 3 | Image Comics |

### Book\_Publisher Table

| PUB\_ID | BOOK\_ID |
| --- | --- |
| 1 | 1 |
| 2 | 2 |
| 1 | 3 |
| 3 | 4 |

### Countries Table

| COUNTRY\_ID | COUNTRY\_NAME |
| --- | --- |
| 1 | US |
| 2 | CAN |
| 3 | UK |
| 4 | AUS |

### Publisher\_Country Table

| PUB\_ID | COUNTRY\_ID |
| --- | --- |
| 1 | 1 |
| 2 | 1 |
| 3 | 1 |


## Full schema

```SQL
-- use JOIN to create produce table ou-- use JOIN to create produce table outputs
select bk.title, auth.authorName, bk.isbn, bk.year_pub, pub.pubName --origin.country_name
from books bk
join books_author bkA on bk.book_id = bkA.book_id
join authors auth on bkA.author_id = auth.author_id
join book_publisher bpub on bk.book_id = bpub.book_id
join publishers pub on bpub.pub_id = pub.pub_id
```

#### Join output

```
+------------------+---------------------+---------------+-----------------+-----------------+-------------------+
| BOOK_TITLE       | BOOK_ISBN           | BOOK_YEAR_PUB | AUTHOR_NAME     | PUBLISHER_NAME  | PUBLISHER_COUNTRY |
+------------------+---------------------+---------------+-----------------+-----------------+-------------------+
| Grit             | 978-1-5011-1110-5   | 2016          | Angela Duckworth| Schuster        | US                |
| Catch-22         | 978-1-4516-2665-0   | 1961          | Joseph Heller   | Schuster        | US                |
| The Martian      | 978-0-553-41802-6   | 2011          | Andy Weir       | Broadway Books  | US                |
| Jupiters Circle  | 978-1-63215-707-2   | 2016          | Mark Millar     | Image Comics    | US                |
+------------------+---------------------+---------------+-----------------+-----------------+-------------------+
```

## ER Diagram

![Books Relationship Diagram](C:\dev\sqlDev\assignments\normalization\books-relation.png)


