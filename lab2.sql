DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    faculty VARCHAR(100)
);

INSERT INTO students (name, age, email, faculty) VALUES ('Alymbek', 21, 'alymbek@example.com', 'AMI');
INSERT INTO students (name, age, email, faculty) VALUES ('Timur', 23, 'timur@example.com', 'SFW');
INSERT INTO students (name, age, email, faculty) VALUES ('Beka', 22, 'beka@example.com', 'IBL');

SELECT * FROM students;

SELECT student_id, faculty FROM students;

SELECT name, email FROM students WHERE name = 'Timur';

SELECT name, email FROM students ORDER BY age;

SELECT name, email FROM students LIMIT 2;

SELECT name, faculty FROM students WHERE faculty = 'SFW'
