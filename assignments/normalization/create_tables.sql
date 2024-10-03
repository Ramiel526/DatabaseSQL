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


