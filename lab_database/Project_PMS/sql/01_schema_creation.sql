CREATE SCHEMA IF NOT EXISTS pms;
SET search_path TO pms, public;

CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    position VARCHAR(50)
);

CREATE TABLE Project (
    project_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    due_date DATE,
    status VARCHAR(20) DEFAULT 'Active' 
        CHECK (status IN ('Active', 'On Hold', 'Completed', 'Cancelled', 'Pending')),
        manager_id INTEGER REFERENCES Employee(employee_id) ON DELETE SET NULL,
        CHECK (due_date IS NULL OR due_date >= start_date)
);

CREATE TABLE ProjectMember (
    project_id INTEGER REFERENCES Project(project_id) ON DELETE CASCADE,
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE,
    role VARCHAR(50) NOT NULL,     
    PRIMARY KEY (project_id, employee_id)
);

CREATE TABLE Task (
    task_id SERIAL PRIMARY KEY,
    project_id INTEGER REFERENCES Project(project_id) ON DELETE CASCADE NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    assigned_to_id INTEGER REFERENCES Employee(employee_id) ON DELETE SET NULL, 
    priority VARCHAR(10) DEFAULT 'Medium' 
        CHECK (priority IN ('Low', 'Medium', 'High', 'Urgent')),
    status VARCHAR(20) DEFAULT 'ToDo' 
        CHECK (status IN ('ToDo', 'InProgress', 'Testing', 'Done', 'Blocked')),
    
    due_date DATE
);

CREATE TABLE TaskDependency (
    predecessor_task_id INTEGER REFERENCES Task(task_id) ON DELETE CASCADE, 
    successor_task_id INTEGER REFERENCES Task(task_id) ON DELETE CASCADE,  
    PRIMARY KEY (predecessor_task_id, successor_task_id),
    CHECK (predecessor_task_id <> successor_task_id)
);

CREATE TABLE ProgressReport (
    report_id SERIAL PRIMARY KEY,
    task_id INTEGER REFERENCES Task(task_id) ON DELETE CASCADE NOT NULL,
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE SET NULL,
    report_date TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    progress_percentage INTEGER CHECK (progress_percentage >= 0 AND progress_percentage <= 100), -- Процент выполнения
    comments TEXT
);

CREATE TABLE TimeLog (
    log_id SERIAL PRIMARY KEY,
    task_id INTEGER REFERENCES Task(task_id) ON DELETE CASCADE NOT NULL,
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE NOT NULL,
    start_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    end_time TIMESTAMP WITHOUT TIME ZONE,
    duration INTERVAL, -- PostgreSQL тип для хранения интервала времени
    
    CHECK (end_time IS NULL OR end_time > start_time)
);
