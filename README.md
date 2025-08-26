## 📌 Project Overview
The **Employee Management System** is a SQL-based project designed to manage employee information, track attendance, and handle payroll processes.  
It demonstrates practical database management skills including **DDL, DML, triggers, stored procedures, and views** in SQL Server.


## ⚙️ Features
1. **Employee Records Management** – Add, update, and maintain employee data.  
2. **Department Records** – Organize employees by departments.  
3. **Attendance Tracking** – Prevent duplicate entries with SQL triggers.  
4. **Payroll Management** – Calculate employee salaries using stored procedures.  
5. **Department-wise Reports** – Summarize payroll and employee info with SQL views.
- 
# 🏗️ Database Schema
1. Departments – Stores department info (HR, IT, Finance, etc.)
2. Employees – Employee personal details, salary, department, and manager
3. Attendance – Tracks daily attendance (Present/Absent/Leave)
4. Payroll – Stores salary, bonuses, deductions, and net pay

### Relationships
- One-to-Many: Departments → Employees  
- One-to-Many: Employees → Attendance, Payroll
- 
# 📊 Sample Queries
1. List employees with their department
2. Count employees per department
3. Attendance report per employee
4. Total payroll cost per month

# 🚀 How to Run
1. Clone this repo:
git clone https://github.com/MaameAbaArhin/Employee-Management-System-SQL-Project-
2. Open the SQL scripts in SQL Server (or MySQL/PostgreSQL with slight modifications).
3. Run the schema creation script (/scripts/schema.sql).
4. Run triggers, stored procedures, and views scripts.
5. Insert sample data (/scripts/sample_data.sql).
6. Test queries and explore reports.
