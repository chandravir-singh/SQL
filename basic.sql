-- create database temp1;
-- DROP DATABASE temp1;
-- CREATE DATABASE temp2;
-- DROP DATABASE temp2;
CREATE DATABASE college;
CREATE DATABASE IF NOT EXISTS college;

DROP DATABASE IF EXISTS company;

USE college;

CREATE TABLE student(
id INT PRIMARY KEY,
name varchar(50),
age INT NOT NULL
);

DROP TABLE IF EXISTS student;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name varchar(50)
);

INSERT INTO student VALUES(1, "Chandravir", 23);
INSERT INTO student VALUES(2, "Chandresh", 22);

SELECT * FROM student;

INSERT INTO student 
(rollno, name)
VALUES 
(101, "CHANDRAVIR"),
(102, "CHANDRESH"),
(103, "VIKASH");

INSERT INTO student VALUES (104, "AAKASH");

CREATE TABLE temp1(
	id INT UNIQUE
);


INSERT INTO temp1 VALUES(101);
INSERT INTO temp1 VALUES(101);


SELECT * FROM temp1;
