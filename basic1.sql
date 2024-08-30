CREATE DATABASE clg;

USE clg;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES 
(101, "Chandravir", 99, "A", "Aligarh"),
(102, "Chandresh", 95, "A", "Aligarh"),
(103, "Aakash", 98, "B", "Mathura"),
(104, "Vikash", 96, "B", "Agra"),
(105, "Anubhav", 94, "C", "Greater Noida"), 
(106, "Ram", 96, "A", "Greater Noida");

SELECT * FROM student; -- it select all coloumn

SELECT name, rollno from student; -- it select only given coloumn

SELECT DISTINCT city FROM student;  -- it gives only non-repeated data

SELECT *
FROM student 
WHERE marks > 95;

SELECT *
FROM student 
WHERE city = "Aligarh";

SELECT *
FROM student 
WHERE marks >= 95 AND  city = "Aligarh";

SELECT *
FROM student 
WHERE marks >= 95 OR city = "Aligarh";

SELECT *
FROM student 
WHERE marks +10 > 100 ; -- arithmetic operations

SELECT *
FROM student 
WHERE marks BETWEEN 95 AND 100; -- between operator use as a range both ranges are inclusive

SELECT *
FROM student 
WHERE city IN ("Mathura", "Agra"); -- in operators match any value in the given list

SELECT *
FROM student 
WHERE city NOT IN ("Mathura", "Agra");  -- it negate the given condition

SELECT *
FROM student 
WHERE marks > 90
LIMIT 3; -- limit gives top 3 data

SELECT *
FROM student 
ORDER BY marks ASC;  -- it sort the data in ascending and descending order

SELECT *
FROM student 
ORDER BY marks DESC
LIMIT 3;

-- AGGREGATE FUNCTION

SELECT MAX(marks) FROM student; -- it return max value
SELECT MIN(marks) FROM student; -- it return min value
SELECT AVG(marks) FROM student; -- it return avg value
SELECT COUNT(marks) FROM student; -- it return count
SELECT SUM(marks) FROM student; -- it return sum of all value

-- group by clause

SELECT city, count(name)
FROM student
GROUP BY city;

SELECT city, name, count(rollno)
FROM student
GROUP BY city, name;

SELECT city, AVG(marks)
FROM student
GROUP BY city;

-- write a query to find the avg marks in each city in ascending order

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks) ; -- by default order by sort by ascending order

SELECT grade, count(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

-- having clause - used when we want to apply any condition after grouping
-- count the number students in each city where max marks score 95

SELECT city , count(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 97;

-- General order
-- SELECT colmn
-- FROM table_name
-- WHERE condition
-- GROUP BY colmn(s)
-- HAVING condition
-- ORDER BY colmn(s) ASC;

-- where applies condition on rows
-- having applies condition on groups

SELECT city , COUNT(rollno)
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 95
ORDER BY city ASC;

-- update command

UPDATE student
SET grade = "O"
WHERE grade = "A";

-- in MYSQL safe mode is ON by default to prevent update so to off the safe mode we use this command
SET SQL_SAFE_UPDATES = 0;
-- to on this command we use 1 instead of 0. 0 means off and 1 means on 

-- UPDATE COMMAND

UPDATE student
SET marks = "100"
WHERE rollno = 106;

UPDATE student
SET grade = "Z"
WHERE marks BETWEEN 95 AND 100;

UPDATE student
SET marks = marks + 1
WHERE marks BETWEEN 90 AND 99;

SELECT * FROM student;

-- DELETE COMMAND - to delete existing command

DELETE FROM student
WHERE city = "AGRA";

SELECT * FROM student;

CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101, "English"),
(102, "Physics");

SELECT * FROM dept;

UPDATE dept
SET id = 103
WHERE id = 102;

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- cascading means if edit one table then other table referring foreign key, it's data also changed.

INSERT INTO teacher 
VALUES
(1, "Adam", 101),
(2, "Bob", 102);

SELECT * FROM teacher;

-- ALTER -> to change the schema

ALTER TABLE student
ADD COLUMN age INT;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

INSERT INTO student
(rollno, name, marks, age)
VALUES
(107, "Bob", 75, 20),
(108, "Charlie", 80, 21);
-- (108, "Charlie", 80, 100) this gives an error because
-- age is varchar(2) but here we enter 100 which is of 3 length so we have to change from VARCHAR TO INT 

ALTER TABLE student
CHANGE age std_age INT;

INSERT INTO student
(rollno, name, marks, std_age)
VALUES
(109, "Denver", 82, 100);

ALTER TABLE student
DROP COLUMN std_age;

ALTER TABLE student
RENAME TO students;

SELECT * FROM students;

-- TRUNCATE TABLE  -> to delete table's data

TRUNCATE TABLE students;

INSERT INTO students
(rollno, full_name, marks, grade, city)
VALUES 
(101, "Chandravir", 99, "A", "Aligarh"),
(102, "Chandresh", 95, "A", "Aligarh"),
(103, "Aakash", 98, "B", "Mathura"),
(104, "Vikash", 96, "B", "Agra"),
(105, "Anubhav", 94, "C", "Greater Noida"), 
(106, "Ram", 70, "A", "Greater Noida");

-- change the name to full_name, delete all the students getting marks less then 80 and delete the column for grades

ALTER TABLE students
CHANGE name full_name VARCHAR(50);

DELETE FROM students
WHERE marks < 80;

ALTER TABLE students
DROP COLUMN grade;

SELECT * FROM students;

-- JOIN

CREATE TABLE std (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO std
(id, name)
VALUES
(101, "Chandravir"),
(102, "Chandresh"),
(103, "Vikash");

CREATE TABLE course (
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course
(id, course)
VALUES
(102, "english"),
(105, "hindi"),
(107, "science"),
(109, "computer science"),
(103, "physics");

SELECT * FROM std;
SELECT * FROM course;

-- inner join

SELECT *
FROM std as s -- this 's' is a alias (alternate name)
INNER JOIN course as c -- this 'c' is a alias (alternate name)
-- ON std.id = course.id;
ON s.id = c.id;

-- left join
SELECT *
FROM std as s 
LEFT JOIN course as c 
ON s.id = c.id;

-- RIGHT JOIN
SELECT *
FROM std as s 
RIGHT JOIN course as c 
ON s.id = c.id;  

-- FULL JOIN
-- LEFT JOIN UNION RIGHT JOIN

SELECT *
FROM std as s 
LEFT JOIN course as c 
ON s.id = c.id
UNION
SELECT *
FROM std as s 
RIGHT JOIN course as c 
ON s.id = c.id;

-- LEFT EXCLUSIVE JOIN -> means data which only contains in left table
SELECT *
FROM std as s 
LEFT JOIN course as c 
ON s.id = c.id
WHERE c.id IS NULL;

-- RIGHT EXCLUSIVE JOIN -> means data which only contains in right table
SELECT *
FROM std as s 
RIGHT JOIN course as c 
ON s.id = c.id
WHERE s.id IS NULL;

-- FULL EXCLUSIVE JOIN -> means data which only contains in left exclusive join and right exclusive join,
-- means data should not be present which is common in both table
SELECT *
FROM std as s 
LEFT JOIN course as c 
ON s.id = c.id
WHERE c.id IS NULL
UNION
SELECT *
FROM std as s 
RIGHT JOIN course as c 
ON s.id = c.id
WHERE s.id IS NULL;

-- UNION gives data from both table without repeating
-- UNION ALL gives data from both table with repeating

SELECT *
FROM std as s 
LEFT JOIN course as c 
ON s.id = c.id
UNION ALL
SELECT *
FROM std as s 
RIGHT JOIN course as c 
ON s.id = c.id;

-- SQL subquery

-- to find the name of students having marks greater then avg we use 2 steps
SELECT AVG(marks) FROM students;
SELECT full_name, marks FROM students WHERE marks > 96.4000; -- this is fixed 

-- to avoid these 2 steps we use sub-queries
SELECT full_name, marks 
FROM students 
WHERE marks > (SELECT AVG(marks) FROM students);  -- this is dynamic

-- print the names of all students having even roll number
SELECT full_name, rollno FROM students WHERE rollno%2 = 0;

-- find the max of max marks from the students of ALIGARH

SELECT MAX(marks)
FROM ( SELECT * FROM students WHERE city = "ALIGARH") AS temp; -- WE SHOULD ALWAYS USE ALIAS in this because it will always throws an error

-- VIEWS -> is a virtual table 

CREATE VIEW view1 AS 
SELECT rollno, full_name, marks FROM students;

SELECT * FROM view1
WHERE marks > 95;

DROP VIEW view1;

