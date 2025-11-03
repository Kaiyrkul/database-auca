SET search_path TO pms, public;
TRUNCATE TABLE TimeLog, ProgressReport, TaskDependency, Task, ProjectMember, Project, Employee RESTART IDENTITY CASCADE;
INSERT INTO Employee (first_name, last_name, email, position) VALUES
('Kaya', 'Odesova', 'k.odesova@company.com', 'Project Manager'), 
('Olga', 'Kim', 'o.kim@company.com', 'Senior Developer'), 
('Arthur', 'Tsoi', 'a.tsoi@company.com', 'Junior Developer'), 
('Kalys', 'Kanatbekov', 'k.kanatbekov@company.com', 'QA Engineer'), 
('Vitaly', 'Lee', 'v.lee@company.com', 'Business Analyst'); 
INSERT INTO Project (name, description, start_date, due_date, status, manager_id) VALUES
('Mobile App "Tasks"', 'Development of a new mobile task management application.', '2025-11-10', '2026-03-30', 'Active', 1), -- ID 1 (Manager: Kaya)
('Updating the CMS of the website', 'Updating the content management system and migrating to PostgreSQL.', '2025-09-01', '2025-12-15', 'Active', 5), -- ID 2 (Manager: Vitaly)
('Internal HR Portal', 'Creating an internal portal for the HR department.', '2025-05-01', '2025-10-20', 'Completed', 1); -- ID 3 (Manager: Kaya)
INSERT INTO ProjectMember (project_id, employee_id, role) VALUES
(1, 1, 'Project manager'),
(1, 2, 'Senior Developer'), -- Мария (Senior Dev) работает над Проектом 1
(1, 4, 'QA Engineer'), -- Елена (QA) работает над Проектом 1
(2, 5, 'Project manager'),
(2, 2, 'Senior Developer'), -- Мария (Senior Dev) работает над Проектом 2
(2, 3, 'Junior Developer'), -- Олег (Junior Dev) работает над Проектом 2
(3, 1, 'Project manager'),
(3, 3, 'Junior Developer'), -- Олег работал над завершенным Проектом 3
(3, 5, 'Business Analyst');
INSERT INTO Task (project_id, title, description, assigned_to_id, priority, status, due_date) VALUES
-- Задачи Проекта 1 (Мобильное приложение)
(1, 'Developing an API for authentication', 'Create a REST API for logging in and registering.', 2, 'Urgent', 'InProgress', '2025-11-20'), 
(1, 'UI/UX design of the main page', 'Create layouts in Figma.', 5, 'High', 'ToDo', '2025-11-15'), -- ID 2 (Дмитрий)
(1, 'Setting up the test environment', 'Raise the test server and database.', 2, 'Medium', 'Done', '2025-11-05'), -- ID 3 (Мария)
(1, 'Writing autotests for the API', 'Create authentication tests.', 4, 'High', 'Blocked', '2025-11-25'), -- ID 4 (Елена, блокирована задачей 1)
(2, 'Migration of the database schema to PostgreSQL', 'Migrate an existing schema from MySQL.', 3, 'Urgent', 'InProgress', '2025-11-18'), -- ID 5 (Олег)
(2, 'Updating the contact page', 'Implement a new feedback form.', 2, 'Medium', 'ToDo', '2025-12-01'), -- ID 6 (Мария)
(2, 'Final testing and QA', 'Full testing of the new CMS.', 4, 'Low', 'ToDo', '2025-12-10'); -- ID 7 (Елена)
INSERT INTO TaskDependency (predecessor_task_id, successor_task_id) VALUES
-- Задача 4 (Написание автотестов) зависит от Задачи 1 (Разработка API)
(1, 4);
INSERT INTO ProgressReport (task_id, employee_id, progress_percentage, comments) VALUES
(1, 2, 50, 'API development has begun, and approval of the token format is required.'),
(3, 2, 100, 'The test environment is fully configured and ready to work.'),
(5, 3, 30, 'Migration is taking place with slight delays due to differences in data types.');
INSERT INTO TimeLog (task_id, employee_id, start_time, end_time, duration) VALUES
(3, 2, '2025-11-04 09:00:00', '2025-11-04 13:00:00', '4 hours'),
(5, 3, '2025-11-06 10:00:00', '2025-11-06 12:00:00', '2 hours'),
(5, 3, '2025-11-06 14:00:00', '2025-11-06 17:00:00', '3 hours');
