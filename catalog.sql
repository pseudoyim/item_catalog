--
-- PostgreSQL database dump
-- From command line, run:
-- >>> createdb catalog
-- >>> psql catalog < <path to this file: catalog.sql> 
-- PASSWORD: abcd

CREATE DATABASE IF NOT EXISTS catalog;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;


-- 'authors'
CREATE TABLE IF NOT EXISTS authors (id SERIAL PRIMARY KEY,
									last_name TEXT, 
									first_name TEXT,
									user_id INTEGER	);

-- 'genres'
CREATE TABLE IF NOT EXISTS genres (	id TEXT PRIMARY KEY,
									genre TEXT );

-- 'books'
CREATE TABLE IF NOT EXISTS books (  id SERIAL PRIMARY KEY,
									title TEXT, 
									author_id INTEGER,
									genre_id TEXT,
									pages INTEGER,
									synopsis TEXT,
									date_finished DATE,
									user_id INTEGER,
									UNIQUE (title, author_id));

-- 'users'
CREATE TABLE IF NOT EXISTS users (	id SERIAL PRIMARY KEY,
									last_name TEXT,
									first_name TEXT,
									email TEXT,
									picture TEXT	);

-- 'books' data (each row must be tab-delimited)
COPY authors (id, last_name, first_name, user_id) FROM stdin;
1	Tolstoy	Leo	3
2	Twain	Mark	1
3	Orwell	George	2
\.

-- 'genres' data
COPY genres (id, genre) FROM stdin;
NOV	Novel
FIC	Fiction
BIO	Biography
MYS	Mystery
ROM	Romance
SCI	Science Fiction
SOC	Sociology
PHI	Philosophy
\.

-- 'books' data
COPY books (id, title, author_id, genre_id, pages, synopsis, date_finished, user_id) FROM stdin;
1	War and Peace	1	FIC	1225	The novel chronicles the history of the French invasion of Russia and the impact of the Napoleonic era on Tsarist society through the stories of five Russian aristocratic families.	2019-01-01	3
2	Anna Kerenina	1	NOV	864	A complex novel in eight parts, with more than a dozen major characters, it is spread over more than 800 pages (depending on the translation), typically contained in two volumes. It deals with themes of betrayal, faith, family, marriage, Imperial Russian society, desire, and rural vs. city life. 	2019-02-01	2
3	The Adventures of Tom Sawyer	2	NOV	274	about a young boy growing up along the Mississippi River. It is set in the 1840s in the fictional town of St. Petersburg, inspired by Hannibal, Missouri, where Twain lived as a boy. In the novel Tom Sawyer has several adventures, often with his friend, Huckleberry Finn.	2019-03-01	1
\.

-- 'users' data
COPY users (id, last_name, first_name, email, picture) FROM stdin;
1	Yim	Paul	paul@email.com	https://lh6.googleusercontent.com/-Y8ycnBRsm8A/AAAAAAAAAAI/AAAAAAAACTs/YraoCkWoPv8/photo.jpg
2	Smith	Winston	winston@email.com	
3	Putin	Vladimir	vlad@email.com	
\.

-- Modify initial value for serial primary keys.
ALTER SEQUENCE authors_id_seq RESTART WITH 4;
ALTER SEQUENCE books_id_seq RESTART WITH 4;
ALTER SEQUENCE users_id_seq RESTART WITH 4;