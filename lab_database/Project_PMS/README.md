# 🚀 Project Management System (PMS) Database

## Project Overview

This repository contains the final project for the Database Management Systems course. The project is a robust **Relational Database** designed to function as a core **Project Management System (PMS)**. It handles essential business entities such as projects, tasks, employees, team assignments, progress reports, and detailed time logging.

The database is implemented using **PostgreSQL 17** and demonstrates proficiency in advanced SQL features, data integrity enforcement, and performance optimization.

## 💡 Core Database Functionality

The PMS is structured around the following key relationships and data flows:

1.  **Project Management:** Tracks project timelines, status, and assigned managers.
2.  **Task Assignment:** Manages the breakdown of work, assignment of tasks to employees, and tracking of dependencies.
3.  **Resource Allocation:** Links employees to projects (`ProjectMember`) and tasks (`Task.assigned_to_id`).
4.  **Time Tracking:** Uses the `TimeLog` table to capture actual work hours, allowing for labor cost analysis.
5.  **Integrity and Validation:** Enforces business rules using `CHECK` constraints (e.g., valid project statuses) and foreign keys (`FOREIGN KEY`).

## 📁 Repository Structure and Execution Plan

All SQL scripts are located in the `sql/` directory and must be executed **sequentially** to ensure the database is set up correctly and all demonstration steps are run.

| File | Title | SQL Focus | Key Demonstrations |
| :--- | :--- | :--- | :--- |
| `01_schema_creation.sql` | **Schema Creation (DDL)** | Data Definition Language (DDL) | Creation of **7 core tables** (`Employee`, `Project`, `Task`, etc.), definition of **Primary and Foreign Keys**, and implementing **`CHECK` constraints** for data validation. |
| `02_data_insertion.sql` | **Data Insertion (DML)** | Data Manipulation Language (DML) | Populating the tables with comprehensive **test data** to enable realistic testing of complex queries and scenarios. |
| `03_queries_basic.sql` | **Basic Queries** | Simple SELECT, DML | Demonstrating essential **CRUD** operations (`SELECT`, `INSERT`, `UPDATE`, `DELETE`), simple filtering (`WHERE`), and basic table joining. |
| `04_queries_advanced.sql` | **Advanced Queries** | Aggregation, Window Functions, CTE | Showcasing advanced features like **`GROUP BY`** (e.g., tasks by status), **CTE** (Common Table Expressions), and **`ROW_NUMBER()`** for reporting and analytics. |
| `05_transactions_and_indexes.sql` | **Transactions & Indexes** | Concurrency, Performance | Demonstration of **ACID** properties using a **Transaction Block** (`BEGIN/COMMIT/ROLLBACK`) and performance optimization through **Index Creation** (`CREATE INDEX`) verified with **`EXPLAIN ANALYZE`**. |

## 🛠️ Technology Stack

* **Database Management System (DBMS):** PostgreSQL 17
* **Administration Tool:** pgAdmin 4
* **Version Control:** Git / GitHub
