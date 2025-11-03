SET search_path TO pms, public;
SELECT
    P.name AS project_name,
    T.status,
    COUNT(T.task_id) AS task_count
FROM Task T
JOIN Project P ON T.project_id = P.project_id
GROUP BY P.name, T.status
ORDER BY P.name, task_count DESC;
SELECT
    E.first_name,
    E.last_name,
    -- Суммируем интервалы и извлекаем из них количество часов
    EXTRACT(EPOCH FROM SUM(TL.duration)) / 3600 AS total_hours_logged
FROM TimeLog TL
JOIN Employee E ON TL.employee_id = E.employee_id
GROUP BY E.employee_id, E.first_name, E.last_name
HAVING EXTRACT(EPOCH FROM SUM(TL.duration)) / 3600 > 0 
ORDER BY total_hours_logged DESC;
SELECT
    project_id,
    name
FROM Project
WHERE project_id NOT IN (
    SELECT project_id
    FROM Task
    WHERE status = 'Done'
)
AND status = 'Active';
WITH EmployeeTaskCounts AS (
    SELECT
        assigned_to_id,
        COUNT(task_id) AS active_tasks_count
    FROM Task
    WHERE status IN ('ToDo', 'InProgress', 'Testing', 'Blocked')
    GROUP BY assigned_to_id
)
SELECT
    E.first_name,
    E.last_name,
    ETC.active_tasks_count
FROM EmployeeTaskCounts ETC
JOIN Employee E ON ETC.assigned_to_id = E.employee_id
ORDER BY ETC.active_tasks_count DESC
LIMIT 1;
SELECT
    P.name AS project_name,
    T.title,
    T.due_date,
    T.priority,
    ROW_NUMBER() OVER (PARTITION BY P.project_id ORDER BY T.due_date ASC, T.priority DESC) AS rank_by_due_date
FROM Task T
JOIN Project P ON T.project_id = P.project_id
WHERE T.status IN ('ToDo', 'InProgress')
ORDER BY P.name, rank_by_due_date;
SELECT E.first_name, E.last_name, 'Manager' AS role_type
FROM Employee E
JOIN Project P ON E.employee_id = P.manager_id
GROUP BY E.employee_id
INTERSECT
SELECT E.first_name, E.last_name, 'Member' AS role_type
FROM Employee E
JOIN ProjectMember PM ON E.employee_id = PM.employee_id
WHERE PM.project_id NOT IN (SELECT project_id FROM Project WHERE manager_id = E.employee_id);
SELECT
    E.first_name,
    E.last_name,
    T.title AS task_title,
    TL.duration
FROM TimeLog TL
JOIN Employee E ON TL.employee_id = E.employee_id
JOIN Task T ON TL.task_id = T.task_id
ORDER BY TL.duration DESC
LIMIT 1;