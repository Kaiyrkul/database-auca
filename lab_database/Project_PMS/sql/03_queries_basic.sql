SET search_path TO pms, public;
SELECT employee_id, first_name, last_name, position
FROM Employee;
SELECT project_id, name, start_date, due_date
FROM Project
WHERE status = 'Active';
SELECT task_id, title, due_date
FROM Task
WHERE priority = 'High'
ORDER BY due_date ASC;
SELECT T.task_id, T.title, T.due_date
FROM Task T
JOIN Employee E ON T.assigned_to_id = E.employee_id
WHERE E.first_name = 'Olga' AND E.last_name = 'Kim';
SELECT 
    E.first_name, 
    E.last_name, 
    PM.role
FROM Project P
JOIN ProjectMember PM ON P.project_id = PM.project_id
JOIN Employee E ON PM.employee_id = E.employee_id
WHERE P.name = 'Mobile App "Tasks"';
INSERT INTO Employee (first_name, last_name, email, position) 
VALUES ('Bermet', 'Dadibaeva', 'b.dadibaeva@company.com', 'Junior Tester');
SELECT * FROM Employee WHERE last_name = 'Dadibaeva';
UPDATE Task
SET status = 'Done', due_date = CURRENT_DATE
WHERE title = 'Migration of the database schema to PostgreSQL';
SELECT title, status, due_date FROM Task WHERE title = 'Migration of the database schema to PostgreSQL';
DELETE FROM ProgressReport
WHERE comments LIKE '%approval of the token format is required%';
SELECT * FROM ProgressReport WHERE comments LIKE '%approval of the token format is required%';
UPDATE Task
SET priority = 'Urgent'
WHERE title = 'Updating the contact page' AND project_id = 2;
SELECT T.title, T.status, T.priority, E.first_name, E.last_name
FROM Task T
LEFT JOIN Employee E ON T.assigned_to_id = E.employee_id
ORDER BY T.priority DESC, T.due_date ASC;
