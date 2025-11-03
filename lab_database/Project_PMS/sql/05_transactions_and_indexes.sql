SET search_path TO pms, public;
BEGIN;
SELECT * FROM Task WHERE task_id = 4; 
SELECT * FROM Project WHERE project_id = 3;
UPDATE Task
SET project_id = 3, status = 'Done' 
WHERE task_id = 4;
INSERT INTO ProjectMember (project_id, employee_id, role)
VALUES (3, 4, 'QA Support')
ON CONFLICT (project_id, employee_id) DO NOTHING;
SELECT T.task_id, T.project_id, P.name, PM.employee_id
FROM Task T
JOIN Project P ON T.project_id = P.project_id
LEFT JOIN ProjectMember PM ON P.project_id = PM.project_id AND PM.employee_id = 4
WHERE T.task_id = 4;
COMMIT;
BEGIN;
INSERT INTO Task (project_id, title, assigned_to_id, priority, status)
VALUES (1, 'Broken task test', 2, 'Very High', 'ToDo');
ROLLBACK;
CREATE INDEX idx_employee_name ON Employee (last_name, first_name);
CREATE INDEX idx_task_status_priority ON Task (status, priority);
CREATE INDEX idx_report_task_employee ON ProgressReport (task_id, employee_id);
EXPLAIN ANALYZE
SELECT
    task_id,
    title,
    due_date
FROM Task
WHERE status = 'InProgress' AND priority = 'Urgent';
DROP INDEX idx_employee_name;
DROP INDEX idx_task_status_priority;
DROP INDEX idx_report_task_employee;


